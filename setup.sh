# Existing rcfiles
SRC_BASH_RC="$(realpath .bashrc)"
SRC_BASH_PROFILE="$(realpath .bash_profile)"
SRC_GIT_COMPLETION="$(realpath git-completion.bash)"
SRC_GIT_CONFIG="$(realpath .gitconfig)"
SRC_TMUX_CONFIG="$(realpath .tmux.conf)"
DST_BASH_RC="${HOME}/.bashrc"
DST_BASH_PROFILE="${HOME}/.bash_profile"
DST_GIT_COMPLETION="${HOME}/git-completion.bash"
DST_GIT_CONFIG="${HOME}/.gitconfig"
DST_TMUX_CONFIG="${HOME}/.tmux.conf"

# Link to $HOME
if [ ! -f ${DST_BASH_RC} ]; then
  ln -s ${SRC_BASH_RC} ${DST_BASH_RC}
else
  cat ${SRC_BASH_RC} >> ${DST_BASH_RC} # append
fi

if [ ! -f ${DST_TMUX_CONFIG} ]; then
  ln -s ${SRC_TMUX_CONFIG} ${DST_TMUX_CONFIG}
else
  cat ${SRC_TMUX_CONFIG} >> ${TMUX_CONFIGH_RC} # append
fi

ln -s ${SRC_BASH_PROFILE} ${DST_BASH_PROFILE}
ln -s ${SRC_GIT_COMPLETION} ${DST_GIT_COMPLETION}
ln -s ${SRC_GIT_CONFIG} ${DST_GIT_CONFIG}
