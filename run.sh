#!/bin/bash

# Let's iterate all input VCF files
for file_path in /data/in/files/*.vcf; do

    # Let's extract the filename from the path
    filename=$(basename ${file_path})

    # Let's remove the file extension
    filename=${filename:0:-4}

    # Execute the tool on input file and save the output as .tsv file
    echo "Executing /app/vcflib/bin/vcf2tsv -g ${file_path} > /data/out/files/${filename}.tsv"
    /app/vcflib/bin/vcf2tsv -g ${file_path} > /data/out/files/${filename}.tsv
done