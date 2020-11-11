#!/bin/bash
export SSH=''
export MOVIE_DIR=~/Desktop/media/movies/
export TV_DIR=~/Desktop/media/tv/

figlet "Media Server Manager"

if [ "$(ls $MOVIE_DIR)" ]; then
    tput smso; echo 'Copying Movies...'; tput rmso
    rsync -avzhe ssh --progress $MOVIE_DIR $SSH/media/drive/Movies;
    cd $MOVIE_DIR
    for ITEM in $MOVIE_DIR; 
        do rm -rf ITEM
    done;
fi;

if [ "$(ls $TV_DIR)" ]; then
tput smso; echo 'Copying TV...'; tput rmso
rsync -avzhe ssh --progress $TV_DIR $SSH:/media/drive/TV;
cd $TV_DIR
for ITEM in $TV_DIR; 
do rm -rf ITEM
done;
fi;

cd ~/Desktop/
tput smso; echo "Sync Complete!"; tput rmso