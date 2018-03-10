#!/bin/sh

repos=( "https://github.com/parmar-gaurav/nodejs.git" 
        "https://github.com/parmar-gaurav/nodejs.git" )

for i in "${repos[@]}"
do 
   NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 7 | head -n 1) 
   git clone -b  development --single-branch $i  clone-git-repo/clone_$NEW_UUID
 done

apt-get install nodejs
apt-get install npm

grunt bump -v

mv commit.sh clone-git-repo/
cd clone-git-repo/
chmod +x commit.sh
./commit.sh
