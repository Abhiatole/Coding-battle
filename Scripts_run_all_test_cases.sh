#!/bin/bash

# Directories for test cases
INPUT_DIR="Test Cases/Input"
OUTPUT_DIR="Test Cases/Output"

# Program executable
EXECUTABLE="./a.out"

echo "Current Date and Time (UTC): $(date -u +"%Y-%m-%d %H:%M:%S")"
echo "Current User's Login: $USER"
echo ""
echo "Running all test cases..."
echo ""

# Loop through all input files in the input directory
for input_file in "$INPUT_DIR"/*.txt; do
    # Get the base name (remove path and file extension)
    base=$(basename "$input_file" .txt)
    # Construct the expected output file path
    output_file="${OUTPUT_DIR}/${base}Output.txt"

    echo "Processing test case: $base"
    echo "  Input File:  $input_file"
    echo "  Expected Output File: $output_file"
    echo ""

    # Read the input values
    input_values=$(cat "$input_file")
    echo "  Input Values:"
    echo "$input_values" | sed 's/^/    /' # Indent input values for better readability
    echo ""

    # Run the program with the input file and capture the output
    program_output=$($EXECUTABLE < "$input_file")

    # Check if the expected output file exists
    if [[ -f "$output_file" ]]; then
        # Read the expected output
        expected_output=$(cat "$output_file")

        # Compare the program output with the expected output
        if [[ "$program_output" == "$expected_output" ]]; then
            echo "  Test case passed!"
            echo "  Output Values:"
            echo "$program_output" | sed 's/^/    /' # Indent output values for better readability
        else
            echo "  Test case failed!"
            echo "  Expected Output:"
            echo "$expected_output" | sed 's/^/    /' # Indent for readability
            echo "  Actual Output:"
            echo "$program_output" | sed 's/^/    /' # Indent for readability
        fi
    else
        echo "  Expected output file $output_file is missing!"
        echo "  Output from program:"
        echo "$program_output" | sed 's/^/    /' # Indent for readability
    fi

    echo ""
done

echo "All test cases processed!"