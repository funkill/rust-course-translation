#!/bin/bash

set -uev

source common.sh

cd "${ROOT_DIR}"

TRANSLATION_REPO="git@github.com:funkill/rust-three-days-course.git"
TRANSLATION_BRANCH="russian_translation"
WORK_DIR=`mktemp -d`

git clone $TRANSLATION_REPO -b $TRANSLATION_BRANCH $WORK_DIR

rsync -aougrhtl "${TRANSLATION_DIR}" "${WORK_DIR}"

cd "${WORK_DIR}"
mvr "${CHAPTER_NAME_REGEX}.md" '$1.chapter' "${WORK_DIR}/presentation/chapters/${TRANSLATION_LANG}/*.md"
git add -A .
git commit -m 'update translation'
git push origin "${TRANSLATION_BRANCH}"

cd "${ROOT_DIR}"

rm -rf "${WORK_DIR}"

#
