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
  pname = "librealsense2";
  version = "2.56.4-1";
  src = finalAttrs.passthru.sources."librealsense2";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "dkms" "git" "libglfw3-dev" "libssl-dev" "libudev-dev" "libusb-1.0-dev" "libx11" "opengl" "pkg-config" "udev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "dkms" "git" "libglfw3-dev" "libssl-dev" "libudev-dev" "libusb-1.0-dev" "libx11" "opengl" "pkg-config" "udev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "librealsense2" = substituteSource {
      src = fetchgit {
        name = "librealsense2-source";
        url = "https://github.com/ros2-gbp/librealsense2-release.git";
        rev = "ab11d7bf17ef32e425285f2b4b58dcd7190c9942";
        hash = "sha256-QQLepsGGcNjQ6ZEocJLVNafC5T6HMj7313k4JV6lW8s=";
      };
      substitutions = [
        {
          path = "CMake/catch2-download.cmake.in";
          from = "GIT_REPOSITORY https://github.com/catchorg/Catch2.git";
          to = "URL ${sources."librealsense2/Catch2"}";
        }
        {
          path = "CMake/external_fastdds.cmake";
          from = "GIT_REPOSITORY https://github.com/eProsima/Fast-DDS.git";
          to = "URL ${sources."librealsense2/Fast-DDS"}";
        }
        {
          path = "CMake/external_foonathan_memory.cmake";
          from = "GIT_REPOSITORY https://github.com/foonathan/memory.git";
          to = "URL ${sources."librealsense2/memory"}";
        }
        {
          path = "CMake/external_libcurl.cmake";
          from = "GIT_REPOSITORY \"https://github.com/curl/curl.git\"";
          to = "URL ${sources."librealsense2/curl"}";
        }
        {
          path = "CMake/external_libusb.cmake";
          from = "GIT_REPOSITORY \"https://github.com/libusb/libusb-cmake.git\"";
          to = "URL ${sources."librealsense2/libusb-cmake"}";
        }
        {
          path = "CMake/pybind11-download.cmake.in";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11.git\"";
          to = "URL ${sources."librealsense2/pybind11"}";
        }
        {
          path = "CMake/pybind11-json-download.cmake.in";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11_json.git\"";
          to = "URL ${sources."librealsense2/pybind11_json"}";
        }
        {
          path = "wrappers/opencv/dnn/CMakeLists.txt";
          from = "DOWNLOAD \"\${PROTOTEXT_URL}\"";
          to = "DOWNLOAD file://${sources."librealsense2/MobileNetSSD_deploy"}";
        }
      ];
    };
    "librealsense2/Catch2" = substituteSource {
      src = fetchgit {
        name = "Catch2-source";
        url = "https://github.com/catchorg/Catch2.git";
        rev = "6e79e682b726f524310d55dec8ddac4e9c52fb5f";
        hash = "sha256-DqGGfNjKPW9HFJrX9arFHyNYjB61uoL6NabZatTWrr0=";
      };
    };
    "librealsense2/Fast-DDS" = substituteSource {
      src = fetchgit {
        name = "Fast-DDS-source";
        url = "https://github.com/eProsima/Fast-DDS.git";
        rev = "3118cba80c7b0db2c9bd0ede8671e3d31785cbda";
        hash = "sha256-lDbo5DOvqf5qko1C2kHfltANpPqekWia3CaunWps4wU=";
      };
    };
    "librealsense2/MobileNetSSD_deploy" = substituteSource {
      src = fetchurl {
        name = "MobileNetSSD_deploy-source";
        url = "https://raw.githubusercontent.com/chuanqi305/MobileNet-SSD/f5d072ccc7e3dcddaa830e9805da4bf1000b2836/MobileNetSSD_deploy.prototxt";
        hash = "sha256-54FVnE9b6uwqSGzNlSr1tvpAjpSYdhv19PuAtOnw0l4=";
      };
    };
    "librealsense2/curl" = substituteSource {
      src = fetchgit {
        name = "curl-source";
        url = "https://github.com/curl/curl.git";
        rev = "fd567d4f06857f4fc8e2f64ea727b1318f76ad33";
        hash = "sha256-MjB6k8mDJypyuh6BN2hxy2My7/DfImjw+5iI729snBg=";
      };
    };
    "librealsense2/libusb-cmake" = substituteSource {
      src = fetchgit {
        name = "libusb-cmake-source";
        url = "https://github.com/libusb/libusb-cmake.git";
        rev = "cec1e49eec481a6333c218726ecaba8e4f447a07";
        hash = "sha256-Kqe3uIZEwFarVJixMPT72dB2Jx8pWk55XBqDkGhzuqM=";
      };
    };
    "librealsense2/memory" = substituteSource {
      src = fetchgit {
        name = "memory-source";
        url = "https://github.com/foonathan/memory.git";
        rev = "0f0775770fd1c506fa9c5ad566bd6ba59659db66";
        hash = "sha256-nLBnxPbPKiLCFF2TJgD/eJKJJfzktVBW3SRW2m3WK/s=";
      };
    };
    "librealsense2/pybind11" = substituteSource {
      src = fetchgit {
        name = "pybind11-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "a2e59f0e7065404b44dfe92a28aca47ba1378dc4";
        hash = "sha256-SNLdtrOjaC3lGHN9MAqTf51U9EzNKQLyTMNPe0GcdrU=";
      };
    };
    "librealsense2/pybind11_json" = substituteSource {
      src = fetchgit {
        name = "pybind11_json-source";
        url = "https://github.com/pybind/pybind11_json.git";
        rev = "32043f433ed987b2c2ce99d689ec337bcbd4ba95";
        hash = "sha256-e9mBvSg8mIuYO1x2yJhejY3iP0TPIiQXwzxy5asf9tk=";
      };
    };
  });
  meta = {
    description = "\n  Library for controlling and capturing data from the Intel(R) RealSense(TM) D400 devices.\n  ";
  };
})
