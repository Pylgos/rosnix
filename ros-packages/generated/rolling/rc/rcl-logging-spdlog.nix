{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rcl-logging-interface,
  rcpputils,
  rcutils,
  rosSystemPackages,
  spdlog-vendor,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rcl_logging_spdlog" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_spdlog-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "4f719b39b3a71e82677f4a3937be8516957d3d3a";
        hash = "sha256-dOCG1y9kG6RADBDWbKM889bAxOsFn9NVhrhyYcUZ+xI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rcl_logging_spdlog";
  version = "3.2.1-1";
  src = sources."rcl_logging_spdlog";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcl-logging-interface rcpputils rcutils spdlog-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "spdlog" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Implementation of rcl_logging API for an spdlog backend.";
  };
}
