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
  version = "3.6.1-2";
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
        rev = "091f3ffafe76c465a9258512fa54e61f33b7601b";
        hash = "sha256-90L9/j7snjODswHk77iJrX34LtjeAeTWsYd/SibNvAU=";
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
      ];
    };
    "depthai_v3/XLink" = substituteSource {
      src = fetchgit {
        name = "XLink-source";
        url = "https://github.com/luxonis/XLink.git";
        rev = "f001d710be6a4010db913510da08caaa3a58466c";
        hash = "sha256-5EJtspMCasIMeJGITiU4KRfH9rAYqWlyGm29fNnwGUI=";
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
  });
  meta = {
    description = "DepthAI core is a C++ library which comes with firmware and an API to interact with\n        OAK Platform";
  };
})
