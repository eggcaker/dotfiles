from setuptools import setup

setup(
    name='xontrib-xontrib-ec',
    version='0.1.0',
    url='https://github.com/eggcaker/xontrib-ec',
    license='MIT',
    author='eggcaker',
    author_email='eggcaker@gmail.com',
    description='convert the zsh-it to xontrib',
    packages=['xontrib'],
    package_dir={'xontrib': 'xontrib'},
    package_data={'xontrib': ['*.xsh']},
    platforms='any',
)
