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
  version = "3.6.1-2";
  src = finalAttrs.passthru.sources."depthai";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "fmt" "gfortran" "libopencv-dev" "libudev-dev" "libusb-1.0-dev" "nlohmann-json-dev" "spdlog" "tar" "unzip" "zip" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "curl" "fmt" "gfortran" "libopencv-dev" "libudev-dev" "libusb-1.0-dev" "nlohmann-json-dev" "spdlog" "tar" "unzip" "zip" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai" = substituteSource {
      src = fetchgit {
        name = "depthai-source";
        url = "https://github.com/luxonis/depthai-core-release.git";
        rev = "737601c001555eec4ec4435f4d8ed92f503e7972";
        hash = "sha256-A8W/hOOmKRRd+VSoyq5p/3PYfagOTxiAutcW5pRyLLQ=";
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
      ];
    };
    "depthai/XLink" = substituteSource {
      src = fetchgit {
        name = "XLink-source";
        url = "https://github.com/luxonis/XLink.git";
        rev = "f001d710be6a4010db913510da08caaa3a58466c";
        hash = "sha256-5EJtspMCasIMeJGITiU4KRfH9rAYqWlyGm29fNnwGUI=";
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
  });
  meta = {
    description = "DepthAI core is a C++ library which comes with firmware and an API to interact with\n        OAK Platform";
  };
})
