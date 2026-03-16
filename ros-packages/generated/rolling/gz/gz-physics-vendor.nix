{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-cmake-vendor,
  gz-common-vendor,
  gz-dartsim-vendor,
  gz-math-vendor,
  gz-plugin-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  sdformat-vendor,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_physics_vendor";
  version = "0.4.3-1";
  src = finalAttrs.passthru.sources."gz_physics_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-dartsim-vendor gz-math-vendor gz-plugin-vendor gz-utils-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "benchmark" "bullet" "eigen" "gz-physics" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-dartsim-vendor gz-math-vendor gz-plugin-vendor gz-utils-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" "bullet" "eigen" "gz-physics" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_physics_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_physics_vendor-source";
        url = "https://github.com/ros2-gbp/gz_physics_vendor-release.git";
        rev = "84671b1c3e7806cb96cd63484484fceec4a14c33";
        hash = "sha256-1H3WS5ITFYdg54OgP1sJLRXbwAN5HeN/kGiJTP1ROCw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_physics_vendor/gz-physics"}";
        }
      ];
    };
    "gz_physics_vendor/gz-physics" = substituteSource {
      src = fetchgit {
        name = "gz-physics-source";
        url = "https://github.com/gazebosim/gz-physics.git";
        rev = "fcbe4f7e3070d32514b288e98041ccbbbd7452a4";
        hash = "sha256-8iGxH4uzo8fvUlXZKERDi6HrZvPsYXTLY3gspYO2rkM=";
      };
      substitutions = [
        {
          path = "third_party/mujoco_vendor/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google-deepmind/mujoco";
          to = "URL ${sources."gz_physics_vendor/gz-physics/mujoco"}";
        }
      ];
    };
    "gz_physics_vendor/gz-physics/mujoco" = substituteSource {
      src = fetchgit {
        name = "mujoco-source";
        url = "https://github.com/google-deepmind/mujoco";
        rev = "881544c0c58dc2e95fbd132a5ec90b99e012b6f7";
        hash = "sha256-5i+QQIwu8olwsMaYvO8b1vLkOkA4jZVR0xcFMuieF5w=";
      };
      substitutions = [
        {
          path = "cmake/MujocoDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/InteractiveComputerGraphics/TriangleMeshDistance.git";
          to = "URL ${sources."gz_physics_vendor/gz-physics/mujoco/TriangleMeshDistance"}";
        }
        {
          path = "cmake/MujocoDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/aparis69/MarchingCubeCpp.git";
          to = "URL ${sources."gz_physics_vendor/gz-physics/mujoco/MarchingCubeCpp"}";
        }
        {
          path = "cmake/MujocoDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/lvandeve/lodepng.git";
          to = "URL ${sources."gz_physics_vendor/gz-physics/mujoco/lodepng-1"}";
        }
        {
          path = "cmake/MujocoDependencies.cmake";
          from = "GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git";
          to = "URL ${sources."gz_physics_vendor/gz-physics/mujoco/eigen"}";
        }
        {
          path = "cmake/third_party_deps/openusd/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/PixarAnimationStudios/USD.git";
          to = "URL ${sources."gz_physics_vendor/gz-physics/mujoco/USD"}";
        }
        {
          path = "simulate/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/lvandeve/lodepng.git";
          to = "URL ${sources."gz_physics_vendor/gz-physics/mujoco/lodepng-2"}";
        }
      ];
    };
    "gz_physics_vendor/gz-physics/mujoco/MarchingCubeCpp" = substituteSource {
      src = fetchgit {
        name = "MarchingCubeCpp-source";
        url = "https://github.com/aparis69/MarchingCubeCpp.git";
        rev = "f03a1b3ec29b1d7d865691ca8aea4f1eb2c2873d";
        hash = "sha256-90ei0lpJA8XuVGI0rGb3md0Qtq8/bdkU7dUCHpp88Bw=";
      };
    };
    "gz_physics_vendor/gz-physics/mujoco/TriangleMeshDistance" = substituteSource {
      src = fetchgit {
        name = "TriangleMeshDistance-source";
        url = "https://github.com/InteractiveComputerGraphics/TriangleMeshDistance.git";
        rev = "2cb643de1436e1ba8e2be49b07ec5491ac604457";
        hash = "sha256-qG/8QKpOnUpUQJ1nLj+DFoLnUr+9oYkJPqUhwEQD2pc=";
      };
    };
    "gz_physics_vendor/gz-physics/mujoco/USD" = substituteSource {
      src = fetchgit {
        name = "USD-source";
        url = "https://github.com/PixarAnimationStudios/USD.git";
        rev = "363a7c8da8d1937072a5f0989e91faf72eb1fa76";
        hash = "sha256-Oj9mtKF8TyXbXVKT7MME+ju/0+VyyB0N2iv/LBaktjA=";
      };
    };
    "gz_physics_vendor/gz-physics/mujoco/eigen" = substituteSource {
      src = fetchgit {
        name = "eigen-source";
        url = "https://gitlab.com/libeigen/eigen.git";
        rev = "75bcd155c40cb48e647c87c3f29052360255bc9e";
        hash = "sha256-ZBm3ac6Kt7gOqNip6PeNNMiOF0fwG+7PJYA47KT0ogI=";
      };
    };
    "gz_physics_vendor/gz-physics/mujoco/lodepng-1" = substituteSource {
      src = fetchgit {
        name = "lodepng-source";
        url = "https://github.com/lvandeve/lodepng.git";
        rev = "17d08dd26cac4d63f43af217ebd70318bfb8189c";
        hash = "sha256-vnw52G0lY68471dzH7NXc++bTbLRsITSxGYXOTicA5w=";
      };
    };
    "gz_physics_vendor/gz-physics/mujoco/lodepng-2" = substituteSource {
      src = fetchgit {
        name = "lodepng-source";
        url = "https://github.com/lvandeve/lodepng.git";
        rev = "b4ed2cd7ecf61d29076169b49199371456d4f90b";
        hash = "sha256-5cCkdj/izP4e99BKfs/Mnwu9aatYXjlyxzzYiMD/y1M=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-physics 9.1.0\n\n    Gazebo Physics : Physics classes and functions for robot applications\n  ";
  };
})
