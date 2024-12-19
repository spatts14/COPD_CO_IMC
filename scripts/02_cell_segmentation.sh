# $ Set up Steinbock alias
# 1. Set up Stienbock command alias
alias steinbock="docker run -v /Users/sarapatti/Desktop/PhD_projects/Llyod_lab/COPD_CO_IMC/data:/data --platform linux/amd64 -u $(id -u):$(id -g) -p 8888:8888 -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.Xauthority:/home/steinbock/.Xauthority:ro -e DISPLAY=host.docker.internal:0 ghcr.io/bodenmillergroup/steinbock:0.16.1"


# ! OPTION: Can either preform cell segmentation with DeepCell or Illastik + CellProfiler 

# ! Option 1: DeepCell
# # * DeepCell
# # 2. Deep cell - cell segmentation
steinbock segment deepcell --app mesmer --minmax


# ! Option 2: Ilastik and CellProfiler
# TODO: train ilastik classifier
# $ Pixel classification using ilastik
# 3. Prepare the data for ilastik
steinbock classify ilastik prepare --cropsize 50 --seed 123
# 4. Train classifier - To interactively train a new classifier, open the pixel classification project in Ilastik
steinbock apps ilastik