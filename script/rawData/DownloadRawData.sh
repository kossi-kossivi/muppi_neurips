#! /bin/bash

# CHANGED: Using rawData_minimal instead of rawData
# Decompress data directory and go to the rawData directory
cd ../..
unzip datasets/data.zip
mv data/rawData_minimal data/rawData  # because there is no rawData directory in the zip file
cd data/rawData

# download the ID map from uniprot
wget ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/idmapping/by_organism/HUMAN_9606_idmapping_selected.tab.gz
gunzip HUMAN_9606_idmapping_selected.tab.gz

# From moondb, download EMF list
wget http://moondb.hb.univ-amu.fr/sites/default/files/uploaded_files/human_EMF_list.tsv

# Create the PPI network protein list from the edgelist
cd ../../script/rawData/
python rawData_settings.py
