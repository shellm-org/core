if ndef __UTILS_UTILS_SH; then
define  __UTILS_UTILS_SH "
  init
  check
  shellm_activate_check
  shellm_deactivate_check
  have_command
  have_package"

## \brief shellm core utils

## @fn string real_path (void)
## @brief Echo the the real (not symlink) absolute path to $0
## @return Echo: the real path to $0
real_path() {
  local readlink
  readlink=$(which readlink)
  local script_location=${BASH_SOURCE[0]}
  if [ -x "${readlink}" ]; then
    while [ -L "${script_location}" ]; do
      script_location=$("${readlink}" -e "${script_location}")
    done
  fi
  echo "${script_location}"
}

shellm_got() {
  command -v "$1" >/dev/null 2>&1
}

fi # __UTILS_UTILS_SH
