#!/usr/bin/sh

biber -output-directory=out main
latexmk -synctex=1 -interaction=nonstopmode -file-line-error -xelatex -output-directory=out -shell-escape main
