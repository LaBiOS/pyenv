if [[ ! -o interactive ]]; then
    return
fi

compctl -K _scienv scienv

_scienv() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(scienv commands)"
  else
    completions="$(scienv completions ${words[2,-2]})"
  fi

  reply=("${(ps:\n:)completions}")
}
