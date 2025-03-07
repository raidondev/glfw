project "GLFW"
    kind "StaticLib"
    language "C"
    
    targetdir ("Binaries/" .. outputdir .. "/%{prj.name}")
    objdir ("Intermediate/" .. outputdir .. "/%{prj.name}")
    
    files
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c",
        "src/platform.c",
        "src/null_init.c"
    }
    
    filter "system:windows"
        buildoptions { "/utf-8" }
        systemversion "latest"
        staticruntime "on"
        
        files
        {
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",
            "src/win32_module.c"
        }

        defines 
        { 
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

        filter "configurations:Debug or configurations:Release"
            files 
            {
                "src/null_init.c",
                "src/null_monitor.c",
                "src/null_window.c",
                "src/null_joystick.c",
                "src/null_platform.h"
            }

    filter "configurations:Debug"
        runtime "Debug"

    filter "configurations:Release"
        runtime "Release"