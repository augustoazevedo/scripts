# !/bin/sh

#
# When you have a directory with multiple GIT repositories, this script will enter each repo e do a 'git pull'
#

for file in ./*; do

    if [[ -d $file ]] && [[ -d ${file}/.git ]]; then
        cd $file
        branch=$(git rev-parse --abbrev-ref HEAD)
        echo "\033[30;44m\xee\x82\xb0\033[30;44m $file \033[34;40m\xee\x82\xb0\033[0;32m ${branch} \033[0m"
        git pull || exit 1 
        cd ..
    fi
done
