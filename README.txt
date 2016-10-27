ajzsh - Z Shell setup for Andre Jacobs
======================================

This directory contains shell scripts and resources to configure the zsh environment just the way I like it.

This is based on the work of https://github.com/spicycode/ze-best-zsh-config

Directories
-----------

./
	Contains all the scripts that configure Z shell.
	
extras
	Custom configuration for my machine and overrides.

scm
	Scripts for working with source control management systems like git

templates
	At the moment only zshrc.ajzsh exists and is used during the installation process.

utils
	Scripts that provide various utility functions and are not loaded by default.
	
Reference
---------

zsh-lovers guide
http://grml.org/zsh/zsh-lovers.html

reference card
http://www.bash2zsh.com/zsh_refcard/refcard.pdf

#TODO:
* Write an install script
* Change this into a .md and write some better documentation
* Add some git aliasses
* Add some macOS specifics (like aliases for working with finder)
* Fix the completion bug (because of 2line prompt [i.e. type l and tab])
