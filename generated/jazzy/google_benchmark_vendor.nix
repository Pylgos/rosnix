{
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    google_benchmark_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "google_benchmark_vendor-source";
        owner = "ros2-gbp";
        repo = "google_benchmark_vendor-release";
        rev = "2da4208dbfcb32f943585ece1d9ff3e51cb916c6";
        hash = "sha256-YHQEziwNPQzFfRVEHovMpimPk2aOqLC0khzmZStlr8Y=";
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
      src = fetchFromGitHub {
        name = "google_benchmark_vendor-vendor_source-benchmark-0-source";
        owner = "google";
        repo = "benchmark";
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
  version = "0.5.0-2";
  src = sources.google_benchmark_vendor;
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
