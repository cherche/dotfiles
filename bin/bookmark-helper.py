#!/usr/bin/python3

# The outputs of this script should be used in conjunction with
# a djvu/pdf manipulation program. See the following examples.
# 
# djvused beardon.djvu -e "set-outline beardon.djvu.txt" -s
# 
# pdftk doc.pdf dump_data output meta.txt
# pdftk temp.pdf update_info meta.txt output final.pdf
# 
# pdftk doc.pdf dump_data_utf8 output meta.txt
# pdftk temp.pdf update_info_utf8 meta.txt output final.pdf

from typing import List, Tuple, TextIO
import re

class Bookmark:
    """ A representation of a line of a table of contents.

    === Attributes ===
    title: the section title
    level: the depth level
    page: the page number
    """

    def __init__(self, title: str, level: int, page: int) -> None:
        """Initialize a Bookmark instance."""
        self.title = title
        self.level = level
        self.page = page
    
    def __str__(self) -> str:
        """Return a string representation of this Bookmark."""
        return ('({level}, "{title}", {page})').format(
            level=self.level,
            title=self.title,
            page=self.page
        )

def create_pdftk_entry(entry: Bookmark) -> str:
    """Return a string which formats <entry> in the
    pdftk update_info_utf8 syntax."""
    return 'BookmarkBegin\n' \
        + 'BookmarkTitle: {}\n'.format(entry.title) \
        + 'BookmarkLevel: {}\n'.format(entry.level + 1) \
        + 'BookmarkPageNumber: {}\n'.format(entry.page)

def create_pdftk_bookmarks(bookmarks: List[Bookmark]) -> str:
    """Return a string which formats <bookmarks> in the
    pdftk update_info_utf8 syntax.
    """
    string = ''
    for entry in bookmarks:
        string += create_pdftk_entry(entry)
    # Remove extra newline
    return string[:-1]

def create_djvu_entry(entry: Bookmark) -> str:
    """Return a string which formats <entry> in the
    djvused set-outline syntax."""
    return '"{title}" "#{page}"'.format(
        title=entry.title,
        page=entry.page
    )

def indent(string: str, indenter: str) -> str:
    """Indent every nonempty line in <string> by <indenter>.
    """
    lines = string.split('\n')
    for i in range(len(lines)):
        line = lines[i]
        if line != '':
            lines[i] = indenter + line
    return '\n'.join(lines)

def create_djvu_bookmarks_helper(children: List[Bookmark]) -> str:
    """Return a string which formats <children> in the
    djvused set-outline syntax, excluding the "bookmarks" parent.

    Precondition: The first element in <children> has minimal level
    of all the elements in <children>.
    """
    if len(children) == 0:
        return ''
    
    # Build an index of all the top-level bookmark entries
    h_level = children[0].level
    h_indices = []
    for i in range(len(children)):
        child = children[i]
        if child.level == h_level:
            h_indices.append(i)
    h_indices.append(len(children))

    # Now use the above index to build the bookmark sructure
    string = ''
    for i in range(len(h_indices) - 1):
        h_index = h_indices[i]
        h = children[h_index]
        
        # Open bracket
        string += '(' + create_djvu_entry(h)
        # FINALLY at the recursive step!
        h_children = children[h_index + 1:h_indices[i + 1]]
        if len(h_children) != 0:
            string += '\n'
        string += indent(create_djvu_bookmarks_helper(h_children), '  ')
        # Close bracket
        string += ')\n'
    
    return string

def create_djvu_bookmarks(bookmarks: List[Bookmark]) -> str:
    """Return a string which formats <bookmarks> in the
    djvused set-outline syntax, including the "bookmarks" parent.
    """
    return '(bookmarks\n' \
        + indent(create_djvu_bookmarks_helper(bookmarks), '  ') \
        + ')'

def extract_line_data(line: str) -> Tuple:
    """Return a tuple of the bookmark data in <line>.
    """
    title = re.search('"(.+)"', line).group(1)
    # 0-indexed rather than 1-indexed
    indent_matches = re.match(' +', line)
    if indent_matches:
        level = len(indent_matches.group(0)) // 4
    else:
        level = 0
    page = int(re.search('\d+\n$', line).group(0))
    return (title, level, page)

def extract_bookmarks(f: TextIO) -> List[Bookmark]:
    """Return a list of Bookmark objects treating each line in <f>
    as a bookmark. Four-space indentation is enforced and determines bookmark level.
    Empty lines are ignored.

    Precondition: Every nonempty line in the file is correctly formatted.
    """
    bookmarks = []
    line = f.readline()
    while line:
        if line != '\n':
            d = extract_line_data(line)
            bookmarks.append(Bookmark(d[0], d[1], d[2]))
        line = f.readline()
    f.close()
    return bookmarks

import sys, os
import argparse

parser = argparse.ArgumentParser(description='Produce pdftk and djvu bookmark syntax.')
parser.add_argument('--input', '-i', type=str, help='input path', required=True)
parser.add_argument('--mode', '-m', type=str, help='syntax of the output (pdftk or djvu)', required=True)
parser.add_argument('--output', '-o', type=str, help='output path')

# args = parser.parse_args('-i sample.txt -m djvu -o sample.djvu.txt'.split(' '))
args = parser.parse_args(sys.argv[1:])

if __name__ == '__main__':
    INPUT, MODE, OUTPUT = args.input, args.mode, args.output

    # Might not need this check since requirement might be handled by argparse ...
    if INPUT and MODE:
        f = open(INPUT, 'r')
        bookmarks = extract_bookmarks(f)

        if MODE == 'djvu':
            contents = create_djvu_bookmarks(bookmarks)
        elif MODE == 'pdftk':
            contents = create_pdftk_bookmarks(bookmarks)
        
        # Enough to be piped to another command or saved into a file
        print(contents)
        # But if OUTPUT is given, can save also save via Python
        if OUTPUT:
            g = open(OUTPUT, 'w')
            g.write(contents)
            g.close()
            print('Saved to {}'.format(OUTPUT))
    else:
        sys.exit(os.EX_USAGE)
