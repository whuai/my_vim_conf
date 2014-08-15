#!/bin/bash
mkdir -p ~/.vim/after/plugin
ln -s ~/.vim/bundle/ultisnips/after/plugin/* ~/.vim/after/plugin
mkdir ~/.vim/ftdetect
ln -s ~/.vim/bundle/ultisnips/ftdetect/* ~/.vim/ftdetect
