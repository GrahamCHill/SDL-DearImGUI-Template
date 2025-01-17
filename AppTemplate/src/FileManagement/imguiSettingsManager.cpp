//
// Created by Graham Hill on 2025/01/17.
//

#include "imguiSettingsManager.h"

#include <filesystem>


std::string imguiSettingsManager::getIniFilePath(const std::string& appName) {
    std::string iniFilePath;

#ifdef _WIN32
    // On Windows, use %APPDATA%\AppName
    char* appData = nullptr;
    size_t len = 0;

    if (_dupenv_s(&appData, &len, "APPDATA") == 0 && appData != nullptr) {
        iniFilePath = std::string(appData) + "\\" + appName + "\\imgui.ini";
        free(appData);
    } else {
        // Fallback to %USERPROFILE%\Documents\AppName if APPDATA is not set
        char* userProfile = nullptr;
        if (_dupenv_s(&userProfile, &len, "USERPROFILE") == 0 && userProfile != nullptr) {
            iniFilePath = std::string(userProfile) + "\\Documents\\" + appName + "\\imgui.ini";
            free(userProfile);
        } else {
            // Default fallback path if nothing is available
            iniFilePath = "imgui.ini";
        }
    }

#elif defined(__APPLE__)
    // On macOS, use ~/Library/Application Support/AppName
    if (const char *home = std::getenv("HOME")) {
        iniFilePath = std::string(home) + "/Library/Application Support/" + appName + "/imgui.ini";
    }
#elif defined(__linux__)
    // On Linux, use ~/.config/AppName or ~/Documents/AppName

    if (const char* home = std::getenv("HOME")) {
        // Check for the existence of XDG_CONFIG_HOME
        if (const char* xdgConfigHome = std::getenv("XDG_CONFIG_HOME")) {
            iniFilePath = std::string(xdgConfigHome) + "/" + appName + "/imgui.ini";
        } else {
            // Fallback to ~/.config/AppName
            iniFilePath = std::string(home) + "/.config/" + appName + "/imgui.ini";
        }
    } else {
        // Fallback to the current working directory if HOME is not set
        iniFilePath = "./imgui.ini";
    }
#else
    // For other platforms, fallback to the current working directory
    iniFilePath = "./imgui.ini";
#endif
    // Ensure the directory exists
    if (!iniFilePath.empty()) {
        const std::filesystem::path iniDir = std::filesystem::path(iniFilePath).parent_path();
        create_directories(iniDir);
    }

    return iniFilePath;
}