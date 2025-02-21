#!/usr/bin/env python3
import os 
import subprocess

host="/root/test"
dist="/root/test"
host_dir="host"
dist_dir="dist"

def function():
 try:
    os.chdir(host)
    subprocess.run(["pwd"])
    subprocess.run(["tar","-czvf",f"{dist_dir}.tar.gz",host_dir])
    subprocess.run(["mv",f"{dist_dir}.tar.gz",dist_dir])
    subprocess.run(["rm","-r",host_dir])
    subprocess.run(["mkdir",host_dir])
    with open("success.log","w") as file:
        file.write(f"Backup succeeded on {os.popen('date').read()}")
 except Exception as e:
    with open("failed.log","w") as file:
        file.write(f"Backup failed on {os.popen('date').read()} Error: {e}\n")    
function()
