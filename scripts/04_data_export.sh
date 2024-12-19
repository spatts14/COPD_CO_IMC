# $ Set up Steinbock alias
# 1. Set up Stienbock command alias
alias steinbock="docker run -v /Users/sarapatti/Desktop/PhD_projects/Llyod_lab/COPD_CO_IMC/data:/data --platform linux/amd64 -u $(id -u):$(id -g) -p 8888:8888 -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.Xauthority:/home/steinbock/.Xauthority:ro -e DISPLAY=host.docker.internal:0 ghcr.io/bodenmillergroup/steinbock:0.16.1"


# ! Export data

# $ 1. To export images to OME-TIFF, with channel names determined by the panel file
steinbock export ome

# $ 2. To export images to histoCAT
steinbock export histocat

# $ 3. To export images to single csv
steinbock export csv intensities regionprops -o objects.csv

# $ 4. Export to FCS
steinbock export fcs intensities regionprops -o objects.fcs

# $ 5. Export to anndata
steinbock export anndata --intensities intensities --data regionprops --neighbors neighbors -o objects.h5ad

# $ 6. Export neighbors as spatial object graphs, with object data as node attributes (can use in NetworkX)
steinbock export graphs --data intensities
## NetworkX file format: To export the graphs as .gexf or .gml, specify --format gexf or --format gml, respectively.