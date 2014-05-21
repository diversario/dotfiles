ROOT=`pwd`

git submodule update --init

cd $ROOT/bundle/vim
git submodule update --init

cd $ROOT/bundle/tmux
git submodule update --init

cd $ROOT

for f in `ls -a configs | grep -E '\.\w+'`; do
  ln -sf `pwd`/configs/$f $HOME/$f;
done

ln -sf `pwd`/ssh/config $HOME/.ssh/config

ln -sf `pwd`/bundle/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf `pwd`/bundle/vim/vimrc $HOME/.vimrc
ln -sf `pwd`/bundle/oh-my-zsh $HOME/.oh-my-zsh

ln -sf `pwd`/bundle/zsh/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/
