#!/bin/bash

repos=( "https://github.com/parmar-gaurav/nodejs.git" 
        "https://github.com/parmar-gaurav/test_repo.git" )

for i in "${repos[@]}"
do 
   NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 7 | head -n 1) 
   git clone -b  development --single-branch $i clone_$NEW_UUID
 done

#apt-get install npm
#npm install
#npm install -g grunt-cli
#grunt bump -v

#mv commit.sh clone-git-repo/
#cd clone-git-repo/
#chmod +x commit.sh
#./commit.sh

for i in `ls|grep clone`; 
do 
cd clone_$i
npm version patch
echo "--- Pushing clone_$i"; #cd $i; 
 git commit -am 'version updated' && 
 git push; cd ..; 
echo "--- Finished $i"; 
done
