# This script is used to preprocess the raw IMC data using Steinbock
# Written for a Mac OS
# Can be run locally (does not need to be run on HPC)

# ! Format the data for Steinbock analysis and other notes
# data must be stored in a directory called 'raw'
# make a file called panel.csv with the columns 'channel' (IMC metals), 'name' (antibody name), and 'keep'(0 or 1; 1 =include, 0= exclude)
# in the 'raw' directory, only include the unziped files (if you have the zipped and unziped files, will error because of "duplication"; command default is unzipped files)
# install ilastik

# ! Prior to running this script, ensure the following steps have been completed:
# 1. Install Docker desktop
# 2. Open Docker desktop

# Run the following commands in the terminal
# $ Set up Steinbock alias

# Load configuration

# 3. Set up Stienbock command alias
alias steinbock="docker run -v /Users/sarapatti/Desktop/PhD_projects/Llyod_lab/COPD_CO_IMC/data:/data --platform linux/amd64 -u $(id -u):$(id -g) -p 8888:8888 -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.Xauthority:/home/steinbock/.Xauthority:ro -e DISPLAY=host.docker.internal:0 ghcr.io/bodenmillergroup/steinbock:0.16.1"

# 4. Confirm version of Steinbock and alias is set correctly
steinbock --version 

# $ Convert files and filter hot pixels
# 5. Convert the .mcd/.txt files to .tiff files and filter hot pixels
steinbock preprocess imc images --hpf 50
# --hpf FLOAT:  Hot pixel filter (specify delta threshold)
# makes a new directory called 'img' with .tiff images