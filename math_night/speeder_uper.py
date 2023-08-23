# script to speed up the simulation video files by a factor of 5 using ffmpeg
# usage: python speeder_uper.py

import os

# get files in folder
files = os.listdir('./slides/files/simulation')

# make tmp folder if it doesn't exist
if not os.path.exists('./tmp'):
    tmp = os.mkdir('./tmp')

# loop through files (start at number n because the first n-1 are for slides)
n = 96
for i in range(n*2, len(files)):
    # get file name
    file_name = files[i]
    # get command to run
    command = 'ffmpeg -y -i ./slides/files/simulation/' + file_name + ' -filter:v "setpts=0.01*PTS" ./tmp/' + file_name
    # run command
    os.system(command)
    move_files = 'mv ./tmp/* ./slides/files/simulation/'
    os.system(move_files)
