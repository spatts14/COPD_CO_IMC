# $ Set up Steinbock alias

# 1. Set up Steinbock command alias
alias steinbock=alias_steinbock

# ! Export data

# Load configuration
source steinbock_config.yaml

# $ 1. To export images to OME-TIFF, with channel names determined by the panel file
if [ "$export_ome" = true ]; then
  steinbock export ome
fi

# $ 2. To export images to histoCAT
if [ "$export_histocat" = true ]; then
  steinbock export histocat
fi

# $ 3. To export images to single csv
if [ "$export_csv" = true ]; then
  steinbock export csv intensities regionprops -o objects.csv
fi

# $ 4. Export to FCS
if [ "$export_fcs" = true ]; then
  steinbock export fcs intensities regionprops -o objects.fcs
fi

# $ 5. Export to anndata
if [ "$export_anndata" = true ]; then
  steinbock export anndata --intensities intensities --data regionprops --neighbors neighbors -o objects.h5ad
fi

# $ 6. Export neighbors as spatial object graphs, with object data as node attributes (can use in NetworkX)
if [ "$export_graphs" = true ]; then
  steinbock export graphs --data intensities --format $export_format
fi
## NetworkX file format: To export the graphs as .gexf or .gml, specify --format gexf or --format gml, respectively.