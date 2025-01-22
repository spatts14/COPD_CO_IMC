# $ Set up Steinbock alias
# Load configuration
#source steinbock_config.yaml

# 1. Set up Stienbock command alias
alias steinbock="docker run -v /Users/sarapatti/Desktop/PhD_projects/Llyod_lab/COPD_CO_IMC/data:/data --platform linux/amd64 -u $(id -u):$(id -g) -p 8888:8888 -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.Xauthority:/home/steinbock/.Xauthority:ro -e DISPLAY=host.docker.internal:0 ghcr.io/bodenmillergroup/steinbock:0.16.1"

# ! Object measurements

# $ Measure intensities
steinbock measure intensities

# $ Extract spatial object properties
steinbock measure regionprops

# $ Object neighborhood measurements
# Centroid distance
steinbock measure neighbors --type centroids --dmax 15
# Euclidean distance distance is used

# Construct k-nearest neighbor (kNN) graphs based on object centroid distances
steinbock measure neighbors --type centroids --kmax 5

## There are many other options for neighborhood measurements, see the documentation for more details
# https://bodenmillergroup.github.io/steinbock/latest/cli/measurement/