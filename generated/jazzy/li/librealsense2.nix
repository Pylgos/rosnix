{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    Catch2-vendor_source-6e79e682b726f524310d55dec8ddac4e9c52fb5f = substituteSource {
      src = fetchgit {
        name = "Catch2-vendor_source-6e79e682b726f524310d55dec8ddac4e9c52fb5f-source";
        url = "https://github.com/catchorg/Catch2.git";
        rev = "6e79e682b726f524310d55dec8ddac4e9c52fb5f";
        hash = "sha256-DqGGfNjKPW9HFJrX9arFHyNYjB61uoL6NabZatTWrr0=";
      };
      substitutions = [
      ];
    };
    Fast-DDS-vendor_source-ff71eabb0f054a50837638d8b669f1db17243b46 = substituteSource {
      src = fetchgit {
        name = "Fast-DDS-vendor_source-ff71eabb0f054a50837638d8b669f1db17243b46-source";
        url = "https://github.com/eProsima/Fast-DDS.git";
        rev = "ff71eabb0f054a50837638d8b669f1db17243b46";
        hash = "sha256-H1Unfwhu0fWMzck85fEUWOrCPWUHKxbWZEF8ay0Wtak=";
      };
      substitutions = [
      ];
    };
    MobileNetSSD_deploy-vendor_source-0pnjy3lv907vyksinxlqjj741ymnylm9bkbc90mfrsjv9yf5b0g7 = substituteSource {
      src = fetchurl {
        name = "MobileNetSSD_deploy-vendor_source-0pnjy3lv907vyksinxlqjj741ymnylm9bkbc90mfrsjv9yf5b0g7-source";
        url = "https://raw.githubusercontent.com/chuanqi305/MobileNet-SSD/f5d072ccc7e3dcddaa830e9805da4bf1000b2836/MobileNetSSD_deploy.prototxt";
        hash = "sha256-54FVnE9b6uwqSGzNlSr1tvpAjpSYdhv19PuAtOnw0l4=";
      };
      substitutions = [
      ];
    };
    curl-vendor_source-2f33be817cbce6ad7a36f27dd7ada9219f13584c = substituteSource {
      src = fetchgit {
        name = "curl-vendor_source-2f33be817cbce6ad7a36f27dd7ada9219f13584c-source";
        url = "https://github.com/curl/curl.git";
        rev = "2f33be817cbce6ad7a36f27dd7ada9219f13584c";
        hash = "sha256-sR4Pv5YWcS5/zWUff5f9ASFkx7Fv75WdtpnxiKG4Ulc=";
      };
      substitutions = [
      ];
    };
    json-vendor_source-9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03 = substituteSource {
      src = fetchgit {
        name = "json-vendor_source-9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03-source";
        url = "https://github.com/nlohmann/json.git";
        rev = "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03";
        hash = "sha256-7F0Jon+1oWL7uqet5i1IgHX0fUw/+z0QwEcA3zs5xHg=";
      };
      substitutions = [
      ];
    };
    librealsense2-9b999a96567dc0721be20811b3f715c0c33227d1 = substituteSource {
      src = fetchgit {
        name = "librealsense2-9b999a96567dc0721be20811b3f715c0c33227d1-source";
        url = "https://github.com/IntelRealSense/librealsense2-release.git";
        rev = "9b999a96567dc0721be20811b3f715c0c33227d1";
        hash = "sha256-tI3pz5+/WaOQ2PifY/4auyUraj3cReWbBOFBn7k6Hok=";
      };
      substitutions = [
        {
          path = "CMake/catch2-download.cmake.in";
          from = "GIT_REPOSITORY https://github.com/catchorg/Catch2.git";
          to = "URL ${Catch2-vendor_source-6e79e682b726f524310d55dec8ddac4e9c52fb5f}";
        }
        {
          path = "CMake/external_fastdds.cmake";
          from = "GIT_REPOSITORY https://github.com/eProsima/Fast-DDS.git";
          to = "URL ${Fast-DDS-vendor_source-ff71eabb0f054a50837638d8b669f1db17243b46}";
        }
        {
          path = "CMake/external_foonathan_memory.cmake";
          from = "GIT_REPOSITORY https://github.com/foonathan/memory.git";
          to = "URL ${memory-vendor_source-0f0775770fd1c506fa9c5ad566bd6ba59659db66}";
        }
        {
          path = "CMake/external_libcurl.cmake";
          from = "GIT_REPOSITORY \"https://github.com/curl/curl.git\"";
          to = "URL ${curl-vendor_source-2f33be817cbce6ad7a36f27dd7ada9219f13584c}";
        }
        {
          path = "CMake/external_libusb.cmake";
          from = "GIT_REPOSITORY \"https://github.com/ev-mp/libusb.git\"";
          to = "URL ${libusb-vendor_source-2a7372db54094a406a755f0b8548b614ba8c78ec}";
        }
        {
          path = "CMake/json-download.cmake.in";
          from = "GIT_REPOSITORY \"https://github.com/nlohmann/json.git\"";
          to = "URL ${json-vendor_source-9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03}";
        }
        {
          path = "CMake/pybind11-download.cmake.in";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11.git\"";
          to = "URL ${pybind11-vendor_source-0bd8896a4010f2d91b2340570c24fa08606ec406}";
        }
        {
          path = "CMake/pybind11-json-download.cmake.in";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11_json.git\"";
          to = "URL ${pybind11_json-vendor_source-b02a2ad597d224c3faee1f05a56d81d4c4453092}";
        }
        {
          path = "wrappers/opencv/dnn/CMakeLists.txt";
          from = "DOWNLOAD \"\${PROTOTEXT_URL}\"";
          to = "DOWNLOAD file://${MobileNetSSD_deploy-vendor_source-0pnjy3lv907vyksinxlqjj741ymnylm9bkbc90mfrsjv9yf5b0g7}";
        }
      ];
    };
    libusb-vendor_source-2a7372db54094a406a755f0b8548b614ba8c78ec = substituteSource {
      src = fetchgit {
        name = "libusb-vendor_source-2a7372db54094a406a755f0b8548b614ba8c78ec-source";
        url = "https://github.com/ev-mp/libusb.git";
        rev = "2a7372db54094a406a755f0b8548b614ba8c78ec";
        hash = "sha256-KYM8Aaz4kV7GFiQVy+dgFk6tPvDlJI6iPY5ddt4+OIE=";
      };
      substitutions = [
      ];
    };
    memory-vendor_source-0f0775770fd1c506fa9c5ad566bd6ba59659db66 = substituteSource {
      src = fetchgit {
        name = "memory-vendor_source-0f0775770fd1c506fa9c5ad566bd6ba59659db66-source";
        url = "https://github.com/foonathan/memory.git";
        rev = "0f0775770fd1c506fa9c5ad566bd6ba59659db66";
        hash = "sha256-nLBnxPbPKiLCFF2TJgD/eJKJJfzktVBW3SRW2m3WK/s=";
      };
      substitutions = [
      ];
    };
    pybind11-vendor_source-0bd8896a4010f2d91b2340570c24fa08606ec406 = substituteSource {
      src = fetchgit {
        name = "pybind11-vendor_source-0bd8896a4010f2d91b2340570c24fa08606ec406-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "0bd8896a4010f2d91b2340570c24fa08606ec406";
        hash = "sha256-Rlr6Ec6BEujTxQkQ9UP+6u0cYeFsJlj7U346MtRM6QM=";
      };
      substitutions = [
      ];
    };
    pybind11_json-vendor_source-b02a2ad597d224c3faee1f05a56d81d4c4453092 = substituteSource {
      src = fetchgit {
        name = "pybind11_json-vendor_source-b02a2ad597d224c3faee1f05a56d81d4c4453092-source";
        url = "https://github.com/pybind/pybind11_json.git";
        rev = "b02a2ad597d224c3faee1f05a56d81d4c4453092";
        hash = "sha256-Kl/QflV2bBoH72/LW03K8JDlhBF+DYYXL47A5s1nmTw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "librealsense2";
  version = "2.55.1-1";
  src = sources.librealsense2-9b999a96567dc0721be20811b3f715c0c33227d1;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "dkms" "libglfw3-dev" "libssl-dev" "libudev-dev" "libusb-1.0-dev" "libx11" "opengl" "udev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Library for controlling and capturing data from the Intel(R) RealSense(TM) D400 devices.";
  };
}
