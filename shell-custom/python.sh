# based on https://gist.github.com/luzfcb/1a7f64adf5d12c2d357d0b4319fe9dcd

if [ -f "$HOME/.pyenv/bin/pyenv" ] && ! type -P pyenv &>/dev/null ; then
  export PYTHON_CONFIGURE_OPTS="--enable-shared"
  export PYTHON_CFLAGS="-O2"
  export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  if [[ ! "$(pyenv which python)" == "/usr/bin/python" ]] ; then 
    pyenv virtualenvwrapper_lazy;
  fi
fi

