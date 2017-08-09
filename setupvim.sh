#!/usr/bin/ssh


mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


cd ~/.vim/bundle && \
    git clone https://github.com/tpope/vim-sensible.git

cd ~/.vim/bundle && \
    git clone https://github.com/tsaleh/vim-align.git
