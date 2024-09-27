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
    benchmark-vendor_source-344117638c8ff7e239044fd0fa7085839fc03021 = substituteSource {
      src = fetchgit {
        name = "benchmark-vendor_source-344117638c8ff7e239044fd0fa7085839fc03021-source";
        url = "https://github.com/google/benchmark.git";
        rev = "344117638c8ff7e239044fd0fa7085839fc03021";
        hash = "sha256-gztnxui9Fe/FTieMjdvfJjWHjkImtlsHn6fM1FruyME=";
      };
      substitutions = [
      ];
    };
    google_benchmark_vendor-4cd9ab59e6d6008c683bfbaa1d6318b4161f1107 = substituteSource {
      src = fetchgit {
        name = "google_benchmark_vendor-4cd9ab59e6d6008c683bfbaa1d6318b4161f1107-source";
        url = "https://github.com/ros2-gbp/google_benchmark_vendor-release.git";
        rev = "4cd9ab59e6d6008c683bfbaa1d6318b4161f1107";
        hash = "sha256-WrjzHkA0QyQgQwI49E9/Y9oPnefrrun/xNZN19mF2fY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${benchmark-vendor_source-344117638c8ff7e239044fd0fa7085839fc03021}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "google_benchmark_vendor";
  version = "0.6.0-1";
  src = sources.google_benchmark_vendor-4cd9ab59e6d6008c683bfbaa1d6318b4161f1107;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "benchmark" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "git" ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package provides Google Benchmark.";
  };
}
