{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "lvr2";
  version = "25.2.2-1";
  src = finalAttrs.passthru.sources."lvr2";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "embree" "glut" "libflann-dev" "libgdal-dev" "libgsl" "libhdf5-dev" "libopencv-dev" "libtiff-dev" "libxi-dev" "libxmu-dev" "lz4" "ocl-icd-opencl-dev" "tbb" "yaml-cpp" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "embree" "glut" "libflann-dev" "libgdal-dev" "libgsl" "libhdf5-dev" "libopencv-dev" "libtiff-dev" "libxi-dev" "libxmu-dev" "lz4" "ocl-icd-opencl-dev" "tbb" "yaml-cpp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lvr2" = substituteSource {
      src = fetchgit {
        name = "lvr2-source";
        url = "https://github.com/ros2-gbp/lvr2-release.git";
        rev = "9207cc24e604ad19744d654a71682f7ef4597e30";
        hash = "sha256-NKcr5GzoaK0V20RweIQ50Ekq4ubaoEZYHIL1D9rz8SU=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/CesiumGS/cesium-native\"";
          to = "URL ${sources."lvr2/cesium-native"}";
        }
        {
          path = "ext/spdlog/bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${sources."lvr2/benchmark"}";
        }
        {
          path = "ext/spdmon/cmake/Conan.cmake";
          from = "DOWNLOAD \"https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake\"";
          to = "DOWNLOAD file://${sources."lvr2/conan"}";
        }
        {
          path = "ext/spdmon/cmake/Vcpkg.cmake";
          from = "DOWNLOAD \"https://github.com/microsoft/vcpkg/raw/master/scripts/buildsystems/vcpkg.cmake\"";
          to = "DOWNLOAD file://${sources."lvr2/vcpkg"}";
        }
      ];
    };
    "lvr2/benchmark" = substituteSource {
      src = fetchgit {
        name = "benchmark-source";
        url = "https://github.com/google/benchmark.git";
        rev = "f91b6b42b1b9854772a90ae9501464a161707d1e";
        hash = "sha256-EAJk3JhLdkuGKRMtspTLejck8doWPd7Z0Lv/Mvf3KFY=";
      };
    };
    "lvr2/cesium-native" = substituteSource {
      src = fetchgit {
        name = "cesium-native-source";
        url = "https://github.com/CesiumGS/cesium-native";
        rev = "52b181f94d3b330e3c8dfc123fd545d8f66d2123";
        hash = "sha256-RnF+effrQUoCNMFCFZt2KzHTTj0HaVL/tBjEobOV0+U=";
      };
      substitutions = [
        {
          path = "extern/spdlog/bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${sources."lvr2/cesium-native/benchmark"}";
        }
      ];
    };
    "lvr2/cesium-native/benchmark" = substituteSource {
      src = fetchgit {
        name = "benchmark-source";
        url = "https://github.com/google/benchmark.git";
        rev = "f91b6b42b1b9854772a90ae9501464a161707d1e";
        hash = "sha256-EAJk3JhLdkuGKRMtspTLejck8doWPd7Z0Lv/Mvf3KFY=";
      };
    };
    "lvr2/conan" = substituteSource {
      src = fetchurl {
        name = "conan-source";
        url = "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake";
        hash = "sha256-dckr59c5q2nDyaHNC/RyjNCNoUOhh3brQ/jirxasys4=";
      };
    };
    "lvr2/vcpkg" = substituteSource {
      src = fetchurl {
        name = "vcpkg-source";
        url = "https://github.com/microsoft/vcpkg/raw/master/scripts/buildsystems/vcpkg.cmake";
        hash = "sha256-Kyhq+w611unTGXnSBuAANIiP7pimJI/7l8gqRSJUp+E=";
      };
    };
  });
  meta = {
    description = "\nThe Las Vegas Surface Reconstruction Toolkit is an Open Source toolkit to reconstruct triangle meshes \nfrom unordered point clouds. It supports the generation of textured models either using colored point \nclouds or point clouds plus images and according calibration matrices. The LVR toolkit provides an \nOpen Source C++ API for meshing and texture generation as well as an I/O interface to store the generated \nmeshes in different exchange formats including Stanford PLY, Wavefront OBJ and Collada. In contrast to other \nmeshing software, it focuses on reconstruction of large scale environments on city scale from high resolution \npoint clouds.\n  ";
  };
})
