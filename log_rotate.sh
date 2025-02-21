#/bin/bash

HOST_DIR="/root/filesystem/var/log/myapp"
DIST_DIR="/root/dist/dist"
LOG_FILE="/root/true.log"
ERROR_LOG="/root/error.log"
REMOTE_HOST="user@server"
SSH_KEY="/.ssh/id_rsa"
MAX_SIZE="10240"
SIZE=$(stat . | grep "Size" | awk '{print $2}') 
MAX_TIME="30"
TIME="date | awk '{print $3}'"

calc_size () {
cd "$HOST_DIR"
for file in $(ls -al | grep "./*log");
        do 
        echo "$SIZE $TIME"
        if [ "$SIZE" -ge "$MAX_SIZ"E || "$TIME" -ge "$MAX_TIM"E ];
        then 
                tar -czvf "$file.tar.gz" "$file"
                echo "file succusseded  $(date)" > "$LOG_FILE"
                #scp -i "$SSH_KEY" "$DIST_DIR" "$REMOTE_HOST":/backup  
        else
                echo "failled $(date)" > "$ERROR_LOG"
        fi
   done
rm -r "$HOST_DIR"
mkdir "$HOST_DIR"
}

calc_size