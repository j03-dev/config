#!/usr/bin/env python3
import re
from os import popen, system

output = popen("xinput | grep TouchPad").read()
device = re.search(r"id=(\d+)", output).group(1)

natural_props_raw = popen(f'xinput list-props {device} | grep "Natural Scrolling Enabled ("').read()
natural_scrolling_prop = re.search(r'((\d+))', natural_props_raw).group(0)

tapping_props_raw = popen(f'xinput list-props {device} | grep "Tapping Enabled ("').read()
tapping_prop = re.search(r'((\d+))', tapping_props_raw).group(0)

system(f"xinput set-prop {device} --type=int --format=8 {natural_scrolling_prop} 1")
system(f"xinput set-prop {device} --type=int --format=8 {tapping_prop} 1")
