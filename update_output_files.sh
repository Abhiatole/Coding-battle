#!/bin/bash

# Directory containing test cases
TEST_CASE_DIR="Test Cases"

# Program executable
EXECUTABLE="./a.out"

echo "Current Date and Time (UTC): $(date -u +"%Y-%m-%d %H:%M:%S")"
echo "Current User's Login: $USER"
echo ""
echo "Updating output files with actual program output..."
echo ""

# Loop through all input files in the test case directory
for input_file in "$TEST_CASE_DIR"/*Input*.txt; do
    # Get the base name (remove path and "Input.txt" suffix)
    base=$(basename "$input_file" | sed 's/Input.txt//')
    # Construct output file name
    output_file="${TEST_CASE_DIR}/${base}Output.txt"
    
    echo "Processing test case: $base"
    echo "  Input:  $input_file"
    echo "  Output: $output_file"
    
    # Run the program with the input file and capture the output
    result=$($EXECUTABLE < "$input_file")
    
    # Save the output to the output file
    echo -n "$result" > "$output_file"
    
    echo "  Result: $result"
    echo "  Output file updated successfully!"
    echo ""
done

echo "All output files have been updated!"