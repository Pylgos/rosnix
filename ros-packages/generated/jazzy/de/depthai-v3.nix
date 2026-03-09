{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_v3";
  version = "3.2.2-2";
  src = finalAttrs.passthru.sources."depthai_v3";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "fmt" "gfortran" "libopencv-dev" "libudev-dev" "libusb-1.0-dev" "nlohmann-json-dev" "spdlog" "tar" "unzip" "zip" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "curl" "fmt" "gfortran" "libopencv-dev" "libudev-dev" "libusb-1.0-dev" "nlohmann-json-dev" "spdlog" "tar" "unzip" "zip" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai_v3" = substituteSource {
      src = fetchgit {
        name = "depthai_v3-source";
        url = "https://github.com/luxonis/depthai-core-v3-release.git";
        rev = "4e74c55083e3cb1d9e9c396b000c70f4a730d44d";
        hash = "sha256-PS1D/v+2tQVY+3shLW+1+CKXJQjiSaHPozeQcp+mqy0=";
      };
      substitutions = [
        {
          path = "3rdparty/xtensor/benchmark/downloadGBenchmark.cmake.in";
          from = "GIT_REPOSITORY    https://github.com/google/benchmark.git";
          to = "URL ${sources."depthai_v3/benchmark"}";
        }
        {
          path = "cmake/depthaiDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/luxonis/XLink.git";
          to = "URL ${sources."depthai_v3/XLink"}";
        }
        {
          path = "cmake/depthaiDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/luxonis/libnop.git";
          to = "URL ${sources."depthai_v3/libnop"}";
        }
        {
          path = "cmake/depthaiDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/luxonis/xtensor.git";
          to = "URL ${sources."depthai_v3/xtensor"}";
        }
        {
          path = "cmake/depthaiDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/luxonis/xtl.git";
          to = "URL ${sources."depthai_v3/xtl"}";
        }
        {
          path = "cmake/depthaiDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/nlohmann/json.git";
          to = "URL ${sources."depthai_v3/json"}";
        }
      ];
    };
    "depthai_v3/XLink" = substituteSource {
      src = fetchgit {
        name = "XLink-source";
        url = "https://github.com/luxonis/XLink.git";
        rev = "ffe0f85a0d0cdfd89cfef90611eb53af2748ea11";
        hash = "sha256-YFCV20YVTlrRhEQ3D0EVuW9WlaD5SpUbE+0q9c/GMzc=";
      };
    };
    "depthai_v3/benchmark" = substituteSource {
      src = fetchgit {
        name = "benchmark-source";
        url = "https://github.com/google/benchmark.git";
        rev = "336bb8db986cc52cdf0cefa0a7378b9567d1afee";
        hash = "sha256-sGfqJ4MbUNeVqjW79iLgHK2uUYeIu7UcN1JB4M9touM=";
      };
    };
    "depthai_v3/json" = substituteSource {
      src = fetchgit {
        name = "json-source";
        url = "https://github.com/nlohmann/json.git";
        rev = "55f93686c01528224f448c19128836e7df245f72";
        hash = "sha256-cECvDOLxgX7Q9R3IE86Hj9JJUxraDQvhoyPDF03B2CY=";
      };
      substitutions = [
        {
          path = "docs/mkdocs/docs/integration/hunter/CMakeLists.txt";
          from = "URL \"https://github.com/cpp-pm/hunter/archive/v0.23.297.tar.gz\"";
          to = "URL ${sources."depthai_v3/json/v0"}";
        }
      ];
    };
    "depthai_v3/json/v0" = substituteSource {
      src = fetchzip {
        name = "v0-source";
        url = "https://github.com/cpp-pm/hunter/archive/v0.23.297.tar.gz";
        hash = "sha256-Ybn/JTo2oysJMX73IYvxCMWruj0y73Gi+4UaYH+P+H0=";
      };
      substitutions = [
        {
          path = "cmake/projects/OpenSSL/schemes/url_sha1_openssl.cmake.in";
          from = ". \"@HUNTER_GLOBAL_SCRIPT_DIR@/clear-all.sh\" && ";
          to = "";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz\"";
          to = "URL ${sources."depthai_v3/json/v0/hunter-nlohmann_json-2_1_1-p1"}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/nlohmann/json/archive/v3.8.0.tar.gz\"";
          to = "URL ${sources."depthai_v3/json/v0/hunter-nlohmann_json-3_8_0"}";
        }
      ];
    };
    "depthai_v3/json/v0/hunter-nlohmann_json-2_1_1-p1" = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-2_1_1-p1-source";
        url = "https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz";
        hash = "sha256-6gYd5belTZidGBO8bLgqIQAF5EeKaH8wzZ/zNNtd3r4=";
      };
    };
    "depthai_v3/json/v0/hunter-nlohmann_json-3_8_0" = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-3_8_0-source";
        url = "https://github.com/nlohmann/json/archive/v3.8.0.tar.gz";
        hash = "sha256-x5+UfP8tXzDOTK4P9Ldn2L9XYzhCLDPP6sjZDI+bgiY=";
      };
    };
    "depthai_v3/libnop" = substituteSource {
      src = fetchgit {
        name = "libnop-source";
        url = "https://github.com/luxonis/libnop.git";
        rev = "ab842f51dc2eb13916dc98417c2186b78320ed10";
        hash = "sha256-d2z/lDI9pe5TR82MxGkR9bBMNXPvzqb9Gsd5jOv6x1A=";
      };
      substitutions = [
        {
          path = "cmake/modules/FindGMock.cmake";
          from = "GIT_REPOSITORY \"https://github.com/google/googlemock.git\"";
          to = "URL ${sources."depthai_v3/libnop/googlemock"}";
        }
        {
          path = "cmake/modules/FindGMock.cmake";
          from = "GIT_REPOSITORY \"https://github.com/google/googletest.git\"";
          to = "URL ${sources."depthai_v3/libnop/googletest"}";
        }
      ];
    };
    "depthai_v3/libnop/googlemock" = substituteSource {
      src = fetchgit {
        name = "googlemock-source";
        url = "https://github.com/google/googlemock.git";
        rev = "778dc88acb34184f7c1e9208dac338dd4cd2aaf8";
        hash = "sha256-7KdgGz+dVi1AT/4pHt00wP2AtQJbZyjrYLhLMCsyb30=";
      };
    };
    "depthai_v3/libnop/googletest" = substituteSource {
      src = fetchgit {
        name = "googletest-source";
        url = "https://github.com/google/googletest.git";
        rev = "6d1deeb565be215554ee28f0ec9c1ed0b12afa8e";
        hash = "sha256-w2JP5XDUPzyOtf6OY/UFkARa5X5w66W/IRnUAQ3Jg0s=";
      };
    };
    "depthai_v3/xtensor" = substituteSource {
      src = fetchgit {
        name = "xtensor-source";
        url = "https://github.com/luxonis/xtensor.git";
        rev = "d070cfcba9418ec45e5399708100eee1181a9573";
        hash = "sha256-QPiDWSHMQuhKpUsnk+KeeHjfSEtWoWIyAUE8Z4oPn1A=";
      };
      substitutions = [
        {
          path = "benchmark/downloadGBenchmark.cmake.in";
          from = "GIT_REPOSITORY    https://github.com/google/benchmark.git";
          to = "URL ${sources."depthai_v3/xtensor/benchmark"}";
        }
      ];
    };
    "depthai_v3/xtensor/benchmark" = substituteSource {
      src = fetchgit {
        name = "benchmark-source";
        url = "https://github.com/google/benchmark.git";
        rev = "336bb8db986cc52cdf0cefa0a7378b9567d1afee";
        hash = "sha256-sGfqJ4MbUNeVqjW79iLgHK2uUYeIu7UcN1JB4M9touM=";
      };
    };
    "depthai_v3/xtl" = substituteSource {
      src = fetchgit {
        name = "xtl-source";
        url = "https://github.com/luxonis/xtl.git";
        rev = "2da8e13ef3d7d9d6ccae3fd68f07892160e8b6c6";
        hash = "sha256-1gO6H1IJyq9wJgHCCpwix9NrzH0VjpyxaWSE7BQutvA=";
      };
    };
  });
  meta = {
    description = "DepthAI core is a C++ library which comes with firmware and an API to interact with\n        OAK Platform";
  };
})
