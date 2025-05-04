#include <iostream>
#include <fstream>
#include <filesystem>
#include <vector>

namespace fs = std::filesystem;

void writeFile(const std::string& folder, const std::string& filename, const std::string& content) {
    std::ofstream file(folder + "/" + filename);
    if (file.is_open()) {
        file << content;
        file.close();
        std::cout << "Created: " << filename << std::endl;
    } else {
        std::cerr << "Failed to create file: " << filename << std::endl;
    }
}

int main() {
    // Define the folder name
    const std::string folder = "Test Cases";

    // Create the folder if it doesn't exist
    if (!fs::exists(folder)) {
        fs::create_directory(folder);
        std::cout << "Folder 'Test Cases' created." << std::endl;
    } else {
        std::cout << "Folder 'Test Cases' already exists." << std::endl;
    }

    // Define test case contents
    std::vector<std::pair<std::string, std::string>> testCases = {
        // Sample Test Cases
        {"SampleInput1.txt", "5 4 2\n10 5 8 7 3\n1 2\n1 3\n2 4\n3 5\n"},
        {"SampleOutput1.txt", "12\n"},
        {"SampleInput2.txt", "3 2 1\n10 20 15\n1 2\n1 3\n"},
        {"SampleOutput2.txt", "20\n"},

        // Basic Test Cases
        {"BasicInput1.txt", "6 6 2\n5 10 7 8 12 6\n1 2\n1 3\n2 4\n3 5\n4 6\n5 6\n"},
        {"BasicOutput1.txt", "21\n"},
        {"BasicInput2.txt", "8 7 3\n10 8 6 14 7 9 12 5\n1 2\n1 3\n2 4\n2 5\n3 6\n4 7\n6 8\n"},
        {"BasicOutput2.txt", "19\n"},
        {"BasicInput3.txt", "10 12 4\n5 8 12 7 10 6 15 4 9 11\n1 2\n1 3\n2 4\n2 5\n3 6\n4 7\n5 8\n6 8\n6 9\n7 10\n8 10\n9 10\n"},
        {"BasicOutput3.txt", "23\n"},
        {"BasicInput4.txt", "4 4 2\n20 15 10 25\n1 2\n1 3\n2 4\n3 4\n"},
        {"BasicOutput4.txt", "25\n"},

        // Boundary Test Cases
        {"BoundaryInput1.txt", "1 0 0\n10\n"},
        {"BoundaryOutput1.txt", "10\n"},
        {"BoundaryInput2.txt", "20 30 10\n100 95 90 85 80 75 70 65 60 55 50 45 40 35 30 25 20 15 10 5\n1 2\n1 3\n2 4\n3 5\n4 6\n5 7\n6 8\n7 9\n8 10\n9 11\n10 12\n11 13\n12 14\n13 15\n14 16\n15 17\n16 18\n17 19\n18 20\n2 3\n4 5\n6 7\n8 9\n10 11\n12 13\n14 15\n16 17\n18 19\n3 4\n5 6\n7 8\n9 10\n11 12\n"},
        {"BoundaryOutput2.txt", "506\n"},

        // Edge Test Cases
        {"EdgeInput1.txt", "6 5 2\n10 15 20 25 30 35\n1 2\n2 3\n3 4\n4 5\n5 6\n"},
        {"EdgeOutput1.txt", "100\n"},
        {"EdgeInput2.txt", "5 0 2\n10 15 20 25 30\n"},
        {"EdgeOutput2.txt", "15\n"},

        // Corner Test Cases
        {"CornerInput1.txt", "7 10 7\n10 8 12 15 7 9 11\n1 2\n1 3\n2 4\n2 5\n3 5\n3 6\n4 7\n5 7\n6 7\n1 5\n"},
        {"CornerOutput1.txt", "22\n"},
        {"CornerInput2.txt", "8 12 4\n10 10 10 10 10 10 10 10\n1 2\n1 3\n1 4\n2 5\n2 6\n3 6\n3 7\n4 7\n4 8\n5 8\n6 8\n7 8\n"},
        {"CornerOutput2.txt", "20\n"}
    };

    // Write test cases to files
    for (const auto& testCase : testCases) {
        writeFile(folder, testCase.first, testCase.second);
    }

    std::cout << "All test cases have been created in the 'Test Cases' folder." << std::endl;

    return 0;
}