//
// Created by Graham Hill on 2025/01/03.
//

#ifndef FILEDIALOG_H
#define FILEDIALOG_H

#include <iostream>
#include <string>



class fileDialog {
public:
// Ensure the path has a trailing slash/backslash
static std::string ensureTrailingSlash(const std::string& path) ;

// Platform-specific function to get executable path
static std::string getExecutablePath() ;

// Platform-specific function to get documents folder
static std::string getDocumentsPath() ;

// Persistent storage for the last selected path
static std::string getLastSelectedPath() ;

static void saveLastSelectedPath(const std::string& path) ;

// int main() {
//     // Get last selected path
//     std::string lastPath = getLastSelectedPath();
//
//     // Determine the default path (fall back to executable path or documents folder)
//     if (lastPath.empty()) {
//         lastPath = getExecutablePath(); // Default to executable directory
//         // Uncomment the line below to default to the documents folder instead:
//         // lastPath = getDocumentsPath();
//     }
//
//     const char* filePath = tinyfd_openFileDialog(
//         "Select a File",        // Title
//         lastPath.c_str(),       // Default path (last or fallback)
//         0,                      // Number of filters
//         nullptr,                // Filters
//         nullptr,                // Description
//         0                       // Allow multiple selections (0 = no, 1 = yes)
//     );
//
//     if (filePath) {
//         std::cout << "Selected file: " << filePath << std::endl;
//
//         // Save the path of the containing directory
//         std::string selectedPath = std::string(filePath).substr(0, std::string(filePath).find_last_of("\\/"));
//         saveLastSelectedPath(selectedPath);
//     } else {
//         std::cout << "No file selected" << std::endl;
//     }
//
//     return 0;
// }

};



#endif //FILEDIALOG_H
