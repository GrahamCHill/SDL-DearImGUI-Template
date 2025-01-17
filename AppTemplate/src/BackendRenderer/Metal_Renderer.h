//
// Created by Graham Hill on 2025/01/17.
//

#ifndef METAL_RENDERER_H
#define METAL_RENDERER_H

#include <SDL.h>

#include "imgui.h"


class MetalRenderer {
public:
    MetalRenderer();
    ~MetalRenderer();

    void metal_SetSDLHint();

    void metal_SetupPlatform();

};

#endif // METAL_BACKEND_H

