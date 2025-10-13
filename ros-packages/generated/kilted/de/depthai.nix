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
  pname = "depthai";
  version = "3.0.7-1";
  src = finalAttrs.passthru.sources."depthai";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "gfortran" "libopencv-dev" "libudev-dev" "libusb-1.0-dev" "nlohmann-json-dev" "tar" "unzip" "zip" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "curl" "gfortran" "libopencv-dev" "libudev-dev" "libusb-1.0-dev" "nlohmann-json-dev" "tar" "unzip" "zip" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai" = substituteSource {
      src = fetchgit {
        name = "depthai-source";
        url = "https://github.com/luxonis/depthai-core-release.git";
        rev = "c07f8f0a0fc7bc9d88e03be03a78ab12c574148f";
        hash = "sha256-Q0xKxuzu+RAL7f4edEPmLQl7JvgZdot6tZiIu/m9ebg=";
      };
      substitutions = [
        {
          path = "3rdparty/xtensor/benchmark/downloadGBenchmark.cmake.in";
          from = "GIT_REPOSITORY    https://github.com/google/benchmark.git";
          to = "URL ${sources."depthai/benchmark"}";
        }
        {
          path = "cmake/depthaiDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/luxonis/XLink.git";
          to = "URL ${sources."depthai/XLink"}";
        }
        {
          path = "cmake/depthaiDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/luxonis/libnop.git";
          to = "URL ${sources."depthai/libnop"}";
        }
        {
          path = "cmake/depthaiDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/luxonis/xtensor.git";
          to = "URL ${sources."depthai/xtensor"}";
        }
        {
          path = "cmake/depthaiDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/luxonis/xtl.git";
          to = "URL ${sources."depthai/xtl"}";
        }
        {
          path = "cmake/depthaiDependencies.cmake";
          from = "GIT_REPOSITORY https://github.com/nlohmann/json.git";
          to = "URL ${sources."depthai/json"}";
        }
      ];
    };
    "depthai/XLink" = substituteSource {
      src = fetchgit {
        name = "XLink-source";
        url = "https://github.com/luxonis/XLink.git";
        rev = "13790284ce12969c169940f88aad755bd91146db";
        hash = "sha256-Sf4KsMBLw9A9C0tPqTEGvYho+arAgZl/f0CKlswjIMY=";
      };
    };
    "depthai/benchmark" = substituteSource {
      src = fetchgit {
        name = "benchmark-source";
        url = "https://github.com/google/benchmark.git";
        rev = "336bb8db986cc52cdf0cefa0a7378b9567d1afee";
        hash = "sha256-sGfqJ4MbUNeVqjW79iLgHK2uUYeIu7UcN1JB4M9touM=";
      };
    };
    "depthai/json" = substituteSource {
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
          to = "URL ${sources."depthai/json/v0"}";
        }
      ];
    };
    "depthai/json/v0" = substituteSource {
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
          to = "URL ${sources."depthai/json/v0/hunter-nlohmann_json-2_1_1-p1"}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/nlohmann/json/archive/v3.8.0.tar.gz\"";
          to = "URL ${sources."depthai/json/v0/hunter-nlohmann_json-3_8_0"}";
        }
      ];
    };
    "depthai/json/v0/hunter-nlohmann_json-2_1_1-p1" = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-2_1_1-p1-source";
        url = "https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz";
        hash = "sha256-6gYd5belTZidGBO8bLgqIQAF5EeKaH8wzZ/zNNtd3r4=";
      };
    };
    "depthai/json/v0/hunter-nlohmann_json-3_8_0" = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-3_8_0-source";
        url = "https://github.com/nlohmann/json/archive/v3.8.0.tar.gz";
        hash = "sha256-x5+UfP8tXzDOTK4P9Ldn2L9XYzhCLDPP6sjZDI+bgiY=";
      };
    };
    "depthai/libnop" = substituteSource {
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
          to = "URL ${sources."depthai/libnop/googlemock"}";
        }
        {
          path = "cmake/modules/FindGMock.cmake";
          from = "GIT_REPOSITORY \"https://github.com/google/googletest.git\"";
          to = "URL ${sources."depthai/libnop/googletest"}";
        }
      ];
    };
    "depthai/libnop/googlemock" = substituteSource {
      src = fetchgit {
        name = "googlemock-source";
        url = "https://github.com/google/googlemock.git";
        rev = "778dc88acb34184f7c1e9208dac338dd4cd2aaf8";
        hash = "sha256-7KdgGz+dVi1AT/4pHt00wP2AtQJbZyjrYLhLMCsyb30=";
      };
    };
    "depthai/libnop/googletest" = substituteSource {
      src = fetchgit {
        name = "googletest-source";
        url = "https://github.com/google/googletest.git";
        rev = "6d1deeb565be215554ee28f0ec9c1ed0b12afa8e";
        hash = "sha256-w2JP5XDUPzyOtf6OY/UFkARa5X5w66W/IRnUAQ3Jg0s=";
      };
    };
    "depthai/xtensor" = substituteSource {
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
          to = "URL ${sources."depthai/xtensor/benchmark"}";
        }
      ];
    };
    "depthai/xtensor/benchmark" = substituteSource {
      src = fetchgit {
        name = "benchmark-source";
        url = "https://github.com/google/benchmark.git";
        rev = "336bb8db986cc52cdf0cefa0a7378b9567d1afee";
        hash = "sha256-sGfqJ4MbUNeVqjW79iLgHK2uUYeIu7UcN1JB4M9touM=";
      };
    };
    "depthai/xtl" = substituteSource {
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
