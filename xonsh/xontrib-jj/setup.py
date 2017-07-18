from setuptools import setup

setup(
    name='xontrib-jj',
    version='0.1.0',
    url='https://github.com/eggcaker/xontrib-jj',
    license='MIT',
    author='eggcaker',
    author_email='eggcaker@gmail.com',
    description='convert the zsh-it to xontrib',
    packages=['xontrib'],
    package_dir={'xontrib': 'xontrib'},
    package_data={'xontrib': ['*.xsh']},
    platforms='any',)
