# Usage #
```
git clone --recurse-submodules https://github.com/airhuman/my_vim_conf.git
```



# FAQ #
## if ultisnips doesn't work with vundle 
```
$ cd ~/.vim
$ /bin/bash init_ultisnips.sh
```

## Command-T
for Ubuntu
```
$ cd ~/.vim/bundle/Command-T/ruby/command-t
$ sudo apt-get install ruby1.9.1-dev ruby-dev 
$ ruby extconf.rb
$ make
```

## Using clang-format to format c++ code
```
$ sudo apt-get install clang-format-3.5
$ sudo ln -s /usr/bin/clang-format-3.5 /usr/bin/clang-format
# $ clang-format -style=Google -dump-config > ~/.clang-format
$ ln -s ~/.vim/etc/clang-format ~/.clang-format
```

## YCM
for Ubuntu
```
$ sudo apt-get install cmake libpython2.7-dev
```

## python autoformat
for Ubuntu
```
$ sudo apt-get install python-autopep8
```
for mac
```
$ sudo pip install autopep8
```

# for vim-livedown
```
sudo npm install -g livedown
```
