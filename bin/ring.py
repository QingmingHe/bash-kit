#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" brief description

Author: Qingming He
Email: he_qing_ming@foxmail.com
Date: 2016-10-20 20:34:37

Description
===========


"""
from math import pi, sqrt


def rings(n, r):
    V = pi * r * r
    v = V / n
    for i in range(n):
        print sqrt(v * (i+1) / pi)


def main():
    import argparse
    parser = argparse.ArgumentParser(
        description="split rings with equal volumes",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )

    parser.add_argument('n', type=int,
                        help='number of rings')
    parser.add_argument('r', type=float,
                        help='outer radius')
    args = parser.parse_args()
    rings(args.n, args.r)

if __name__ == "__main__":
    main()
