import os
import sys
import subprocess

try:
    sys.argv.remove('--push')
    push = True
except ValueError:
    push = False

subprocess.check_call(['git', 'fetch', 'origin'])
all_branches = subprocess.check_output(['git', 'branch']).decode().split('\n')
all_branches = [word.replace('*', '').strip() for word in all_branches if word]
print(all_branches)

for branch in ['circleci_27', 'circleci_34', 'circleci_35']:
    if branch not in all_branches:
        subprocess.check_call(['git', 'branch', branch])
    subprocess.check_call(['git', 'checkout', branch])
    subprocess.check_call(['git', 'merge', 'master', '--squash'])
    subprocess.check_call(['git', 'commit', '-m', '"UPLOAD: merge master"'])
    if push:
        subprocess.check_call(['git', 'push', 'origin', branch])

subprocess.check_call(['git', 'checkout', 'master'])
