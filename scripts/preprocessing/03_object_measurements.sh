# $ Set up Steinbock alias
# Load configuration
source steinbock_config.yaml

# 1. Set up Stienbock command alias
alias steinbock= alias_steinbock


# ! Object measurements

# $ Measure intensities
steinbock measure intensities

# $ Extract spatial object properties
steinbock measure regionprops

# $ Object neighborhood measurements
# Centroid distance
steinbock measure neighbors --type type --dmax dmax
# Euclidean distance distance is used

# Construct k-nearest neighbor (kNN) graphs based on object centroid distances
steinbock measure neighbors --type type --kmax kmax

## There are many other options for neighborhood measurements, see the documentation for more details
# https://bodenmillergroup.github.io/steinbock/latest/cli/measurement/