import os
import sys
import subprocess


def get_package_dir(conda_recipe, py=2.7):
    cmd = ['conda', 'build', '--output', conda_recipe, '--py', str(py)]
    print('cmd', " ".join(cmd))
    print('conda_recipe', conda_recipe)
    output = subprocess.check_output(cmd)
    return output.decode().replace('\n', '')


def tar_xf(fn):
    sh('tar -xf {}'.format(fn))


def sh(cmd):
    try:
        subprocess.check_call(cmd, shell=True)
    except subprocess.CalledProcessError as e:
        try:
            print(e.output.decode())
        except AttributeError:
            print('e.output is ', e.output)
            pass


def update_amber():
    sh('./update_amber --show-applied-patches')
    sh('./update_amber --update')
    sh('./update_amber --show-applied-patches')


def set_compiler_env():
    if sys.platform.startswith('darwin'):
        # make sure to install gfortran
        # https://gcc.gnu.org/wiki/GFortranBinaries#MacOS
        # we do not use clang here since we still need
        # gfortran (so just use included gcc/g++)
        os.environ['CXX'] = '/usr/local/gfortran/bin/g++'
        os.environ['CC'] = '/usr/local/gfortran/bin/gcc'
        os.environ['FC'] = '/usr/local/gfortran/bin/gfortran'


def run_configure():
    sh('./configure --with-python python gnu')


def make_python_serial():
    sh('make python_serial')
