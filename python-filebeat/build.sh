#!/bin/bash

set -ex

set -o pipefail


cd "$(dirname "$0")"

pushd ../filebeat
export GOOS=darwin
export GOARCH=amd64
make clean
make
popd

python setup.py bdist_wheel --plat-name=macosx_10_15_x86_64

pushd ../filebeat
export GOOS=linux
export GOARCH=amd64
make clean
make
popd

python setup.py bdist_wheel --plat-name=linux_x86_64
# Traceback (most recent call last):
#   File "setup.py", line 21, in <module>
#     distclass=BinaryDistribution,
#   File "/Users/stephanstachurski/.pyenv/versions/filebeat-wheel/lib/python3.7/site-packages/setuptools/__init__.py", line 163, in setup
#     return distutils.core.setup(**attrs)
#   File "/Users/stephanstachurski/.pyenv/versions/3.7.8/lib/python3.7/distutils/core.py", line 148, in setup
#     dist.run_commands()
#   File "/Users/stephanstachurski/.pyenv/versions/3.7.8/lib/python3.7/distutils/dist.py", line 966, in run_commands
#     self.run_command(cmd)
#   File "/Users/stephanstachurski/.pyenv/versions/3.7.8/lib/python3.7/distutils/dist.py", line 985, in run_command
#     cmd_obj.run()
#   File "/Users/stephanstachurski/.pyenv/versions/filebeat-wheel/lib/python3.7/site-packages/wheel/bdist_wheel.py", line 328, in run
#     impl_tag, abi_tag, plat_tag = self.get_tag()
#   File "/Users/stephanstachurski/.pyenv/versions/filebeat-wheel/lib/python3.7/site-packages/wheel/bdist_wheel.py", line 278, in get_tag
#     assert tag in supported_tags, "would build wheel with unsupported tag {}".format(tag)
# AssertionError: would build wheel with unsupported tag ('cp37', 'cp37m', 'linux_x86_64')
