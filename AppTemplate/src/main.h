//
// Created by Graham Hill on 2024/12/31.
//

#ifndef MAIN_H
#define MAIN_H

#ifdef __unix__


#elif defined(_WIN32) || defined(WIN32)

#include <windows.h>

#endif


#include "imgui.h"
#include "imgui_impl_sdl2.h"
#include "imgui_impl_vulkan.h"
#include <cstdio>          // printf, fprintf
#include <cstdlib>         // abort
#include <SDL.h>
#include <SDL_vulkan.h>
#include <filesystem>

// Volk headers
#ifdef IMGUI_IMPL_VULKAN_USE_VOLK
#define VOLK_IMPLEMENTATION
#include <volk.h>
#endif

//#define APP_USE_UNLIMITED_FRAME_RATE
#ifdef _DEBUG
#define APP_USE_VULKAN_DEBUG_REPORT
#endif


#endif //MAIN_H
