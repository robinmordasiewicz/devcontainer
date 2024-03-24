#!/bin/bash
#

directory="/tmp/opencommit"
old_string="http://localhost:11434/api/chat"
new_string="http://commit.mordasiewicz.com:11434/api/chat"

if [ -d "${directory}" ]; then
  rm -rf "${directory}"
fi
git clone https://github.com/di-sukharev/opencommit.git "${directory}"

cd ${directory}
find . -type f -print0 | while IFS= read -r -d '' file
do
    if grep -q "${old_string}" "${file}"; then
        echo $file && sed "s|${old_string}|${new_string}|g" "${file}" > "${file}.tmp" && mv -f "${file}.tmp" "${file}"
    fi
done

nvm use node
npm uninstall -g opencommit
cd "${directory}" && npm install -g
cd -
rm -rf ${directory}
