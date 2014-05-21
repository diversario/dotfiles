ROOT=`pwd`

git submodule update --init

cd $ROOT/bundle/vim
git submodule update --init

cd $ROOT/bundle/tmux
git submodule update --init

cd $ROOT

ln -sf `pwd`/configs/* $HOME/

ln -s `pwd`/ssh/config $HOME/.ssh/

ln -sf `pwd`/bundle/tmux/.tmux.conf $HOME/.tmux.conf

ln -sf `pwd`/bundle/vim/vimrc $HOME/.vimrc
