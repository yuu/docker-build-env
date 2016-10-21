#!/bin/bash
# Idea from http://stackoverflow.com/questions/2144406/git-shallow-submodules
for i in $(git submodule | sed -e 's/.* //'); do
    spath=$(git config -f .gitmodules --get submodule.$i.path);
    branch=$(git config -f .gitmodules --get submodule.$i.branch);
    GIT_SSL_NO_VERIFY=1 git clone --depth 1 --branch $branch https://github.com/qt/$spath
done
