# Project Submission

## Folder Structure
```
Project/
├── Test Cases/
│   ├── Input/
│   ├── Output/
├── Scripts/
├── a.out
├── src/
└── README.md
```

## Instructions

### Running All Test Cases
1. Ensure all input files are in `Test Cases/Input/` and corresponding expected output files are in `Test Cases/Output/`.
2. Run the `run_all_test_cases.sh` script:
   ```bash
   ./Scripts/run_all_test_cases.sh
   ```

### Generating Missing Output Files
1. If some input files do not have corresponding output files, use the `generate_output_files.sh` script:
   ```bash
   ./Scripts/generate_output_files.sh
   ```

2. The missing output files will be generated and saved in `Test Cases/Output/`.

### Checking for Missing Output Files
1. Use the `check_input_output_files.sh` script to verify that all input files have corresponding output files:
   ```bash
   ./Scripts/check_input_output_files.sh
   ```

### Source Code
- The main program source code is located in the `src/` directory. Compile it using:
  ```bash
  g++ -o a.out src/main.cpp
  ```
