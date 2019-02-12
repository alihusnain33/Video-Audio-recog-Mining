# -*- coding: utf-8 -*-

'''
This script require
    CLI tools:
        ffmpeg correctly installed and set in PATH
'''

import string
import random
import sys
import subprocess
import os
import json

audio_store_path = "audio/"
text_store_path = "text/"

if len(sys.argv) !=2:
    print("Usage : " + sys.argv[0] + " video_path")
    sys.exit(1)

video_path = sys.argv[1]

file_name = video_path.split("/")[-1].split(".")[0]
#audio_name = ''.join(random.choices(string.ascii_uppercase + string.digits, k=10))

audio_path = audio_store_path + file_name + ".flac"

command = "ffmpeg -loglevel panic -i " + video_path + " -q:a 0 -map a " + audio_path

print("Start retreive audio");

subprocess.run(command.split(), shell=True, check=True)

print("Audio retreive and stored at : " + audio_path);

text_name = video_path.split("/")[-1].split(".")[0]
#text_name = ''.join(random.choices(string.ascii_uppercase + string.digits, k=10))

text_path = text_store_path + file_name + ".txt"

command=["curl", "-X", "POST", "-u", "apikey:maRXhPFlrGMqe2mXsHilpfSFLRY5XP7X3UPkHGh6ZA5l", "--header", "Content-Type: audio/flac", "--data-binary", "@" + audio_path, "https://gateway-lon.watsonplatform.net/speech-to-text/api/v1/recognize"]

print("Retrieving text");

cmd_result = subprocess.run(command, shell=True, check=True, stdout = subprocess.PIPE)

print("Text retrieved");
response = cmd_result.stdout.decode('utf8')
data = json.loads(response)
dump_data = json.dumps(data, indent=2)
text = ""
score = 0
for result in data["results"]:
	if len(text) > 0:
		text += "[...] "
	score += result["alternatives"][0]["confidence"]
	text += result["alternatives"][0]["transcript"]
	
score_txt = "{:.3f}".format(score/float(len(data["results"])));
#print(dump_data);
print("Confidence: " + score_txt);
print(text);
text_file = open(text_path, 'w');
text_file.write(score_txt + "\n");
text_file.write(text);