workspace "Pikmin"
    architecture "x64"

    configurations {
        "Debug",
        "Release",
        "Distribution",
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Pikmin"
    location "Pikmin"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    systemversion "latest"

    targetdir ("binaries/" .. outputdir .. "/%{prj.name}")
    objdir ("intermediates/" .. outputdir .. "/%{prj.name}")

    files {
        "%{prj.name}/source/**.h",
        "%{prj.name}/source/**.cpp",
    }

    includedirs {
        "%{prj.name}/vendor/titanium/source",
        "%{prj.name}/vendor/titanium/Titanium/vendor/spdlog/include",
    }

    filter "system:windows"
        defines "PikminWindows"
    
    filter "configurations:Debug"
        defines "PikminDebug"
        symbols "on"

    filter "configurations:Release"
        defines "PikminRelease"
        optimize "on"

    filter "configurations::Distribution"
        defines "PikminDistribution"
        optimize "on"
    