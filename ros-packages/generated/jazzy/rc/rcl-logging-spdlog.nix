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
        rev = "5648031902b5d7055b6bf46596cf424912d86a3e";
        hash = "sha256-1G9tkqVueqbs4DvEFCJyRqYkNap6ekz9JUZzdLt4emw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rcl_logging_spdlog";
  version = "3.1.0-2";
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
