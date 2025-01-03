//
// Created by Graham Hill on 2025/01/03.
//

#include "fileDialog.h"

std::string fileDialog::ensureTrailingSlash(const std::string& path) {
    if (path.empty()) return path;
    char lastChar = path.back();
#if defined(_WIN32)
    if (lastChar != '\\') return path + "\\";
#else
    if (lastChar != '/') return path + "/";
#endif
    return path;
}

std::string fileDialog::getExecutablePath() {
#if defined(_WIN32)
    char path[MAX_PATH];
    GetModuleFileName(NULL, path, MAX_PATH);
    return ensureTrailingSlash(std::string(path).substr(0, std::string(path).find_last_of("\\/")));
#elif defined(__linux__)
    char result[PATH_MAX];
    ssize_t count = readlink("/proc/self/exe", result, PATH_MAX);
    return ensureTrailingSlash(std::string(result, (count > 0) ? count : 0).substr(0, std::string(result).find_last_of("/")));
#elif defined(__APPLE__)
    char path[PATH_MAX];
    uint32_t size = sizeof(path);
    if (_NSGetExecutablePath(path, &size) == 0) {
        char realPath[PATH_MAX];
        realpath(path, realPath);
        return ensureTrailingSlash(std::string(realPath).substr(
                        0, std::string(realPath).find_last_of('/')));
    }
#endif
    return "";
}

std::string fileDialog::getDocumentsPath() {
#if defined(_WIN32)
    char path[MAX_PATH];
    if (SHGetFolderPath(NULL, CSIDL_PERSONAL, NULL, SHGFP_TYPE_CURRENT, path) == S_OK) {
        return ensureTrailingSlash(std::string(path));
    }
#elif defined(__linux__) || defined(__APPLE__)
    const char* home = getenv("HOME");
    if (!home) {
        struct passwd* pw = getpwuid(getuid());
        home = pw->pw_dir;
    }
    return ensureTrailingSlash(std::string(home) + "/Documents");
#endif
    return "";
}

std::string fileDialog::getLastSelectedPath() {
    if (std::ifstream file("last_path.txt"); file.is_open()) {
        std::string path;
        std::getline(file, path);
        file.close();
        path = ensureTrailingSlash(path);
        return path; // Spliting to above ensures a warning is silenced
    }
    return ""; // No previous path saved
}

void fileDialog::saveLastSelectedPath(const std::string& path) {
    if (std::ofstream file("last_path.txt"); file.is_open()) {
        file << ensureTrailingSlash(path);
        file.close();
    }
}