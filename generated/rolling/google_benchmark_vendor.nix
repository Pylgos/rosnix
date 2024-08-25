{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  gbenchmark,
  git,
  substituteSource,
}:
let
  sources = rec {
    google_benchmark_vendor = substituteSource {
      src = fetchgit {
        name = "google_benchmark_vendor-source";
        url = "https://github.com/ros2-gbp/google_benchmark_vendor-release.git";
        rev = "4cd9ab59e6d6008c683bfbaa1d6318b4161f1107";
        hash = "sha256-WrjzHkA0QyQgQwI49E9/Y9oPnefrrun/xNZN19mF2fY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${google_benchmark_vendor-vendor_source-benchmark-0}";
        }
      ];
    };
    google_benchmark_vendor-vendor_source-benchmark-0 = substituteSource {
      src = fetchgit {
        name = "google_benchmark_vendor-vendor_source-benchmark-0-source";
        url = "https://github.com/google/benchmark.git";
        rev = "344117638c8ff7e239044fd0fa7085839fc03021";
        hash = "sha256-gztnxui9Fe/FTieMjdvfJjWHjkImtlsHn6fM1FruyME=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "google_benchmark_vendor";
  version = "0.6.0-1";
  src = sources.google_benchmark_vendor;
  nativeBuildInputs = [ cmake git ];
  propagatedNativeBuildInputs = [ gbenchmark ];
  buildInputs = [ cmake git ];
  propagatedBuildInputs = [ gbenchmark ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "This package provides Google Benchmark.";
  };
}
