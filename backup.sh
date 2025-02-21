#!/bin/bash

HOST="/root"
HOST_DIR="data"
DIST="/root"
DIST_DIR="dist"
SSH_KEY="/.ssh/id_rsa"
REMOTE_HOST="user@server"
FILE_BACKUP="dist.tar.gz"


backup (){
    cd "$HOST"
    tar -czvf "$FILE_BACKUP" "$HOST_DIR"
    if [ $? -eq 0 ];
    then
    mv "$FILE_BACKUP" "$DIST"/"$DIST_DIR"
    #scp -i "$SSH_KEY" "$DIST"/$"DIST_DIR" "$REMOTE_HOST":/backup  
    echo "backup succeeded in $(date)">backup.log 
    rm -r "$HOST"/"$HOST_DIR"
    mkdir "$HOST"/"$HOST_DIR"
    else 
    echo "backup failed in $(date)">error.log
    fi 
}

backup
