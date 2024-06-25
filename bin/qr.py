#!/usr/bin/python3

import qrcode
from datetime import datetime

import sys, os
import argparse

parser = argparse.ArgumentParser(description='Produce a qr code image file.')

parser.add_argument('-d', '--data', type=str, help='data', required=True)
parser.add_argument('-o', '--output', type=str, help='output file name', default=datetime.now().strftime("%H%M%S"))
parser.add_argument('-v', '--verbose', action='store_true')

parser.add_argument('-V', '--svg', action='store_true', help='produce svg instead?')
# if --svg is passed, fill and back don't matter
# If doing svg though, might be more convenient to use qr directly:
#   qr --factory=svg-path "Some text" > test.svg
#   qr --factory=svg "Some text" > test.svg
#   qr --factory=svg-fragment "Some text" > test.svg
parser.add_argument('-f', '--fill', type=str, help='fill color', default='#000')
parser.add_argument('-b', '--back', type=str, help='back color', default='transparent')

parser.add_argument('-s', '--boxsize', type=int, help='box size (px)', default=10)
parser.add_argument('-r', '--border', type=int, help='border (measured in # of boxes)', default=0)

args = parser.parse_args('-d https://pypi.org/project/qrcode/ -o qrcode --fill #FCD4D5 --back #C41583'.split(''))
# args = parser.parse_args(sys.argv[1:])

if __name__ == '__main__':
    DATA, OUTPUT, DO_VERBOSE = args.data, args.output, args.verbose
    DO_SVG = args.svg
    FILL, BACK = args.fill, args.back
    BOX_SIZE, BORDER = args.boxsize, args.border

    if DO_SVG:
        # Simple factory, just a set of rects.
        # factory = qrcode.image.svg.SvgImage
        # Fragment factory (also just a set of rects)
        # factory = qrcode.image.svg.SvgFragmentImage
        # Combined path factory, fixes white space that may occur when zooming
        factory = qrcode.image.svg.SvgPathImage
        qr.add_data(DATA)
        img = qr.make(image_factory=factory)
        img.save(OUTPUT + '.svg')
    else:
        qr = qrcode.QRCode(error_correction=qrcode.constants.ERROR_CORRECT_L,box_size=BOX_SIZE,border=BORDER)
        qr.add_data(DATA)
        img = qr.make_image(fill_color=FILL, back_color=BACK)
        img.save(OUTPUT + '.png')
