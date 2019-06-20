function check_install_mvr {
  if ! (which mvr 2> /dev/null); then
    cargo install mvr
  fi
}

SCRIPTS_DIR=`dirname "$0" | xargs realpath`
ROOT_DIR=`realpath "${SCRIPTS_DIR}/../"`
ORIGINAL_DIR="${ROOT_DIR}/rust-three-days-course"
ORIGINAL_LANG="en-US"

TRANSLATION_LANG="ru"
TRANSLATION_DIR="${ORIGINAL_DIR}-${TRANSLATION_LANG}"

CHAPTER_NAME_REGEX="([\d\w\-]+)"

check_install_mvr

#
