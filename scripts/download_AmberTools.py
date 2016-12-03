#!/usr/bin/env python

import sys
from urllib import request

full_fn = 'https://dl.dropboxusercontent.com/u/5494759/AmberTools16.tar.bz2'
fn = full_fn.split('/')[-1]
request.urlretrieve(full_fn, fn)
