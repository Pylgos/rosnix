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
  pname = "google_benchmark_vendor";
  version = "0.6.1-2";
  src = finalAttrs.passthru.sources."google_benchmark_vendor";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "git" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "benchmark" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" ]; };
  passthru.sources = mkSourceSet (sources: {
    "google_benchmark_vendor" = substituteSource {
      src = fetchgit {
        name = "google_benchmark_vendor-source";
        url = "https://github.com/ros2-gbp/google_benchmark_vendor-release.git";
        rev = "0563415995fad10d8c03d500309e07345b183ccc";
        hash = "sha256-UxvzpOmsMyQnyjSFJrQuXHMN12uPIbJCkgyNTW469/4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${sources."google_benchmark_vendor/benchmark"}";
        }
      ];
    };
    "google_benchmark_vendor/benchmark" = substituteSource {
      src = fetchgit {
        name = "benchmark-source";
        url = "https://github.com/google/benchmark.git";
        rev = "344117638c8ff7e239044fd0fa7085839fc03021";
        hash = "sha256-gztnxui9Fe/FTieMjdvfJjWHjkImtlsHn6fM1FruyME=";
      };
    };
  });
  meta = {
    description = "This package provides Google Benchmark.";
  };
})
