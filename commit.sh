#!/bin/bash

for i in `ls|grep clone`; 
do 
echo "--- Pushing $i"; cd $i; 
ssh -i "$GIT_SSH_KEYS_PATH" git commit -am 'version updated' && 
ssh -i "$GIT_SSH_KEYS_PATH" git push; cd ..; 
echo "--- Finished $i"; 
done