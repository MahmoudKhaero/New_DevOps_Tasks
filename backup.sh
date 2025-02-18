#/bin/bash

HOST_DIR="/root/backup"
DIST_DIR="/root/dist/dist"
LOG_FILE="/root/true.log"
ERROR_LOG="/root/error.log"
REMOTE_HOST="user@server"
SSH_KEY="/.ssh/id_rsa"

fun () {
cd "$HOST_DIR"
tar -czvf "$DIST_DIR.tar.gz" . 
        if [ $? -eq 0 ];
        then 
                echo "file succusseded  $(date)" > "$LOG_FILE"
                #scp -i "$SSH_KEY" "$DIST_DIR" "$REMOTE_HOST"):/backup  
        else
                echo "failled $(date)" > "$ERROR_LOG"
        fi
rm -r "$HOST_DIR"
mkdir "$HOST_DIR"
}

fun