#!/bin/bash

# Directories for test cases
INPUT_DIR="Test Cases/Input"
OUTPUT_DIR="Test Cases/Output"

echo "Checking if all input files have corresponding output files..."
echo ""

# Initialize a flag to indicate missing files
missing_files_flag=0

# Loop through all input files in the input directory
for input_file in "$INPUT_DIR"/*.txt; do
    # Get the base name (remove path and file extension)
    base=$(basename "$input_file" .txt)
    # Construct the expected output file path
    output_file="${OUTPUT_DIR}/${base}Output.txt"

    # Check if the output file exists
    if [[ ! -f "$output_file" ]]; then
        echo "Missing output file for input file: $input_file"
        echo "  Expected Output File: $output_file"
        missing_files_flag=1
    fi
done

if [[ $missing_files_flag -eq 0 ]]; then
    echo "All input files have corresponding output files!"
else
    echo "Some input files are missing their corresponding output files."
fi