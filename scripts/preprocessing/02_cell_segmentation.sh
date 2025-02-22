# $ Set up Steinbock alias
# Load configuration
#source steinbock_config.yaml

# 1. Set up Stienbock command alias
alias steinbock="docker run -v /Users/sarapatti/Desktop/PhD_projects/Llyod_lab/COPD_CO_IMC/data:/data --platform linux/amd64 -u $(id -u):$(id -g) -p 8888:8888 -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.Xauthority:/home/steinbock/.Xauthority:ro -e DISPLAY=host.docker.internal:0 ghcr.io/bodenmillergroup/steinbock:0.16.1"


# ! OPTION: Can either preform cell segmentation with DeepCell or Illastik + CellProfiler 
# $ Option 1: DeepCell
# # * DeepCell
# # 2. Deep cell - cell segmentation
steinbock segment deepcell --app mesmer --minmax
# --minmax: Channel-wise min-max normalization


# $ Option 2: Ilastik and CellProfiler
# * Pixel classification using ilastik
# 3. Prepare the data for ilastik
steinbock classify ilastik prepare --cropsize 50 --seed 123
# 4. Train classifier - To interactively train a new classifier, open the pixel classification project in Ilastik
steinbock apps ilastik
# ! Include instructions on how to train the classifier in Ilastik

# TODO: determmine how to use CellProfiler
# * CellProfiler
# 5. Pipeline preperation - CellProfiler pipeline is prepared for processing the images
steinbock segment cellprofiler prepare

# 6. Run the pipeline - CellProfiler pipeline is run on the images
steinbock apps cellprofiler

# 7. Batch processing: After the pipeline has been configured, it can be applied to a batch of probability images
steinbock segment cellprofiler run