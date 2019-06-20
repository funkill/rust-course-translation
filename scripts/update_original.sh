#!/bin/bash

set -euv

source common.sh

ORIGINAL_REPO="https://github.com/ferrous-systems/rust-three-days-course.git"

cd "${ROOT_DIR}"

git pull origin master
rm -rf "${ORIGINAL_DIR}"
git clone --depth=1 "${ORIGINAL_REPO}" "${ORIGINAL_DIR}"
rm -rf "${ORIGINAL_DIR}/.git"

mvr "${CHAPTER_NAME_REGEX}.chapter" '$1.md' "${ORIGINAL_DIR}/presentation/chapters/${ORIGINAL_LANG}/*.chapter"

git add -A "${ORIGINAL_DIR}"
git commit -m 'update original'
git push origin master

#
