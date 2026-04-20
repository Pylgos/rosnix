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
  version = "3.2.1-1";
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
        rev = "c61d191f78dd0f905bfc0dddebe734842c1efc45";
        hash = "sha256-IZZ76uFUt83ABHSeOO4wrbc/tIUlG1YaLEFIkZ0nsWE=";
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
        rev = "ffe0f85a0d0cdfd89cfef90611eb53af2748ea11";
        hash = "sha256-YFCV20YVTlrRhEQ3D0EVuW9WlaD5SpUbE+0q9c/GMzc=";
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
