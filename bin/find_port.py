#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" Find Port according to ip

Author: Qingming He @ NECP
Date: 2015-11-13 21:58:06
"""
import os
import sys
import re

host = sys.argv[1]
home = os.getenv("HOME")
ssh_config = os.path.join(home, ".ssh", "config")
port = None
with open(ssh_config) as f:
    for aline in f:
        if re.match("^ *Host +%s$" % (host), aline) is not None:
            for aline in f:
                if re.match("^ *Port +\d+$", aline):
                    port = aline.strip().split()[1]
                    break
            break
print port
