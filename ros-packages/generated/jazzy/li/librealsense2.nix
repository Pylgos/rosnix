{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "librealsense2" = substituteSource {
      src = fetchgit {
        name = "librealsense2-source";
        url = "https://github.com/IntelRealSense/librealsense2-release.git";
        rev = "9b999a96567dc0721be20811b3f715c0c33227d1";
        hash = "sha256-tI3pz5+/WaOQ2PifY/4auyUraj3cReWbBOFBn7k6Hok=";
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
          from = "GIT_REPOSITORY \"https://github.com/ev-mp/libusb.git\"";
          to = "URL ${sources."librealsense2/libusb"}";
        }
        {
          path = "CMake/json-download.cmake.in";
          from = "GIT_REPOSITORY \"https://github.com/nlohmann/json.git\"";
          to = "URL ${sources."librealsense2/json"}";
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
      substitutions = [
      ];
    };
    "librealsense2/Fast-DDS" = substituteSource {
      src = fetchgit {
        name = "Fast-DDS-source";
        url = "https://github.com/eProsima/Fast-DDS.git";
        rev = "ff71eabb0f054a50837638d8b669f1db17243b46";
        hash = "sha256-H1Unfwhu0fWMzck85fEUWOrCPWUHKxbWZEF8ay0Wtak=";
      };
      substitutions = [
      ];
    };
    "librealsense2/MobileNetSSD_deploy" = substituteSource {
      src = fetchurl {
        name = "MobileNetSSD_deploy-source";
        url = "https://raw.githubusercontent.com/chuanqi305/MobileNet-SSD/f5d072ccc7e3dcddaa830e9805da4bf1000b2836/MobileNetSSD_deploy.prototxt";
        hash = "sha256-54FVnE9b6uwqSGzNlSr1tvpAjpSYdhv19PuAtOnw0l4=";
      };
      substitutions = [
      ];
    };
    "librealsense2/curl" = substituteSource {
      src = fetchgit {
        name = "curl-source";
        url = "https://github.com/curl/curl.git";
        rev = "2f33be817cbce6ad7a36f27dd7ada9219f13584c";
        hash = "sha256-sR4Pv5YWcS5/zWUff5f9ASFkx7Fv75WdtpnxiKG4Ulc=";
      };
      substitutions = [
      ];
    };
    "librealsense2/json" = substituteSource {
      src = fetchgit {
        name = "json-source";
        url = "https://github.com/nlohmann/json.git";
        rev = "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03";
        hash = "sha256-7F0Jon+1oWL7uqet5i1IgHX0fUw/+z0QwEcA3zs5xHg=";
      };
      substitutions = [
      ];
    };
    "librealsense2/libusb" = substituteSource {
      src = fetchgit {
        name = "libusb-source";
        url = "https://github.com/ev-mp/libusb.git";
        rev = "2a7372db54094a406a755f0b8548b614ba8c78ec";
        hash = "sha256-KYM8Aaz4kV7GFiQVy+dgFk6tPvDlJI6iPY5ddt4+OIE=";
      };
      substitutions = [
      ];
    };
    "librealsense2/memory" = substituteSource {
      src = fetchgit {
        name = "memory-source";
        url = "https://github.com/foonathan/memory.git";
        rev = "0f0775770fd1c506fa9c5ad566bd6ba59659db66";
        hash = "sha256-nLBnxPbPKiLCFF2TJgD/eJKJJfzktVBW3SRW2m3WK/s=";
      };
      substitutions = [
      ];
    };
    "librealsense2/pybind11" = substituteSource {
      src = fetchgit {
        name = "pybind11-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "0bd8896a4010f2d91b2340570c24fa08606ec406";
        hash = "sha256-Rlr6Ec6BEujTxQkQ9UP+6u0cYeFsJlj7U346MtRM6QM=";
      };
      substitutions = [
      ];
    };
    "librealsense2/pybind11_json" = substituteSource {
      src = fetchgit {
        name = "pybind11_json-source";
        url = "https://github.com/pybind/pybind11_json.git";
        rev = "b02a2ad597d224c3faee1f05a56d81d4c4453092";
        hash = "sha256-Kl/QflV2bBoH72/LW03K8JDlhBF+DYYXL47A5s1nmTw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "librealsense2";
  version = "2.55.1-1";
  src = finalAttrs.passthru.sources."librealsense2";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "dkms" "libglfw3-dev" "libssl-dev" "libudev-dev" "libusb-1.0-dev" "libx11" "opengl" "udev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Library for controlling and capturing data from the Intel(R) RealSense(TM) D400 devices.";
  };
})
