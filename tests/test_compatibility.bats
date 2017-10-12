load data

shells="ash bash bosh bsh csh dash fish ksh mksh posh scsh sh tcsh xonsh yash zsh"

_checkbashisms() {
  checkbashisms -fpx "$@" 2>&1 | sed 's/possible bashism in //g'
  # shellcheck disable=SC2086
  return ${PIPESTATUS[0]}
}

_shell_compatibility() {
  local output script status=${success}
  for script in "$@"; do
   for shell in ${shells}; do
     if command -v "${shell}" >/dev/null; then
       if ! output=$(${shell} -nv "${script}" 2>&1); then
         status=${failure}
         echo "${script}:${shell}"
         echo "${output}" | tail -n2
       fi
     fi
   done
  done
  return ${status}
}

@test "compatibility init.sh (checkbashisms)" {
  skip "Compatibility is not yet enforced"
  _checkbashisms "${SHELLM_ROOT}/init.sh"
}

@test "compatibility scripts (checkbashisms)" {
  skip "Compatibility is not yet enforced"
  _checkbashisms ${scripts}
}

@test "compatibility libraries (checkbashisms)" {
  skip "Compatibility is not yet enforced"
  _checkbashisms ${libs}
}

@test "compatibility init.sh (shells dry run)" {
  skip "Compatibility is not yet enforced"
  _shell_compatibility "${SHELLM_ROOT}/init.sh"
}

@test "compatibility libraries (shells dry run)" {
  skip "Compatibility is not yet enforced"
  _shell_compatibility ${scripts}
}

@test "compatibility scripts (shells dry run)" {
  skip "Compatibility is not yet enforced"
  _shell_compatibility ${libs}
}