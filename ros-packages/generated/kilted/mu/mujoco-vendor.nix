{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mujoco_vendor";
  version = "0.0.6-1";
  src = finalAttrs.passthru.sources."mujoco_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libglfw3-dev" "libx11-dev" "libxcursor-dev" "libxi-dev" "libxinerama-dev" "libxkbcommon-dev" "libxrandr" "pkg-config" "wayland-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libglfw3-dev" "libx11-dev" "libxcursor-dev" "libxi-dev" "libxinerama-dev" "libxkbcommon-dev" "libxrandr" "pkg-config" "wayland-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mujoco_vendor" = substituteSource {
      src = fetchgit {
        name = "mujoco_vendor-source";
        url = "https://github.com/ros2-gbp/mujoco_vendor-release.git";
        rev = "38e18178c82a72ef7c77de8776b05fa46790b0fc";
        hash = "sha256-rP/6h4lLKXmjx+LePWxcHi10MoZVkdJqJ+8Jpx+0aLk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/google-deepmind/mujoco.git";
          to = "VCS_TYPE path VCS_URL ${sources."mujoco_vendor/mujoco"}";
        }
      ];
    };
    "mujoco_vendor/mujoco" = substituteSource {
      src = fetchgit {
        name = "mujoco-source";
        url = "https://github.com/google-deepmind/mujoco.git";
        rev = "e55fff5dea6f1d5dd7963ca52eecc41d05ad0922";
        hash = "sha256-mW1AZKRo5rC3q7VARNI3HNKYGXxnAX6R1AfmY8J1D/Q=";
      };
      substitutions = [
        {
          path = "cmake/MujocoDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/InteractiveComputerGraphics/TriangleMeshDistance.git";
          to = "URL ${sources."mujoco_vendor/mujoco/TriangleMeshDistance"}";
        }
        {
          path = "cmake/MujocoDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/aparis69/MarchingCubeCpp.git";
          to = "URL ${sources."mujoco_vendor/mujoco/MarchingCubeCpp"}";
        }
        {
          path = "cmake/MujocoDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/lvandeve/lodepng.git";
          to = "URL ${sources."mujoco_vendor/mujoco/lodepng-1"}";
        }
        {
          path = "cmake/MujocoDependencies.cmake";
          from = "GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git";
          to = "URL ${sources."mujoco_vendor/mujoco/eigen"}";
        }
        {
          path = "simulate/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/lvandeve/lodepng.git";
          to = "URL ${sources."mujoco_vendor/mujoco/lodepng-2"}";
        }
      ];
    };
    "mujoco_vendor/mujoco/MarchingCubeCpp" = substituteSource {
      src = fetchgit {
        name = "MarchingCubeCpp-source";
        url = "https://github.com/aparis69/MarchingCubeCpp.git";
        rev = "f03a1b3ec29b1d7d865691ca8aea4f1eb2c2873d";
        hash = "sha256-90ei0lpJA8XuVGI0rGb3md0Qtq8/bdkU7dUCHpp88Bw=";
      };
    };
    "mujoco_vendor/mujoco/TriangleMeshDistance" = substituteSource {
      src = fetchgit {
        name = "TriangleMeshDistance-source";
        url = "https://github.com/InteractiveComputerGraphics/TriangleMeshDistance.git";
        rev = "2cb643de1436e1ba8e2be49b07ec5491ac604457";
        hash = "sha256-qG/8QKpOnUpUQJ1nLj+DFoLnUr+9oYkJPqUhwEQD2pc=";
      };
    };
    "mujoco_vendor/mujoco/eigen" = substituteSource {
      src = fetchgit {
        name = "eigen-source";
        url = "https://gitlab.com/libeigen/eigen.git";
        rev = "49623d0c4e1af3c680845191948d10f6d3e92f8a";
        hash = "sha256-jmPPyOHNP8Lrk5BKMhWW6KzizLF4dJB3txqOi2zBW40=";
      };
    };
    "mujoco_vendor/mujoco/lodepng-1" = substituteSource {
      src = fetchgit {
        name = "lodepng-source";
        url = "https://github.com/lvandeve/lodepng.git";
        rev = "17d08dd26cac4d63f43af217ebd70318bfb8189c";
        hash = "sha256-vnw52G0lY68471dzH7NXc++bTbLRsITSxGYXOTicA5w=";
      };
    };
    "mujoco_vendor/mujoco/lodepng-2" = substituteSource {
      src = fetchgit {
        name = "lodepng-source";
        url = "https://github.com/lvandeve/lodepng.git";
        rev = "b4ed2cd7ecf61d29076169b49199371456d4f90b";
        hash = "sha256-5cCkdj/izP4e99BKfs/Mnwu9aatYXjlyxzzYiMD/y1M=";
      };
    };
  });
  meta = {
    description = "Vendor package for MuJoCo simulator of version 3.4.0";
  };
})
