ROOT=`pwd`

git submodule update --init

cd $ROOT/bundle/vim
git submodule update --init
git checkout master
git pull

cd $ROOT/bundle/tmux
git submodule update --init
git checkout master
git pull

cd $ROOT

if [[ ! -f ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

for f in `ls -a configs | grep -E '^\.\w+'`; do
  ln -sf `pwd`/configs/$f $HOME/$f;
done

mkdir -p ~/.config
ln -sf `pwd`/configs/alacritty $HOME/.config/

ln -sf `pwd`/ssh/config $HOME/.ssh/config

ln -sf `pwd`/bundle/tmux/.tmux.conf $HOME/.tmux.conf

ln -sf `pwd`/bundle/vim $HOME/.vim
ln -sf `pwd`/bundle/vim/vimrc $HOME/.vimrc

ln -sf $HOME/.dotfiles/bundle/oh-my-zsh/themes/robbyrussell-better.zsh-theme $HOME/.oh-my-zsh/custom/themes/

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# so z plugin doesn't print an error
if [[ ! -f $HOME/.z ]]; then touch $HOME/.z; fi
