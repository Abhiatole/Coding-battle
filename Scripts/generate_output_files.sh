#!/bin/bash

# Directories for test cases
INPUT_DIR="Test Cases/Input"
OUTPUT_DIR="Test Cases/Output"

# Program executable
EXECUTABLE="./a.out"

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

echo "Generating output files for all input files..."
echo ""

# Loop through all input files in the input directory
for input_file in "$INPUT_DIR"/*.txt; do
    # Get the base name (remove path and file extension)
    base=$(basename "$input_file" .txt)
    # Construct the output file path
    output_file="${OUTPUT_DIR}/${base}Output.txt"

    echo "Processing input file: $input_file"
    echo "  Generating output file: $output_file"

    # Run the program with the input file and capture the output
    program_output=$($EXECUTABLE < "$input_file")

    # Save the program output to the output file
    echo "$program_output" > "$output_file"

    echo "  Output file created successfully!"
    echo ""
done

echo "All output files have been generated!"