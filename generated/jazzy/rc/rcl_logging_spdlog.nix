{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rcl_logging_interface,
  rcpputils,
  rcutils,
  rosSystemPackages,
  spdlog_vendor,
  substituteSource,
}:
let
  sources = rec {
    rcl_logging_spdlog-5648031902b5d7055b6bf46596cf424912d86a3e = substituteSource {
      src = fetchgit {
        name = "rcl_logging_spdlog-5648031902b5d7055b6bf46596cf424912d86a3e-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "5648031902b5d7055b6bf46596cf424912d86a3e";
        hash = "sha256-1G9tkqVueqbs4DvEFCJyRqYkNap6ekz9JUZzdLt4emw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_spdlog";
  version = "3.1.0-2";
  src = sources.rcl_logging_spdlog-5648031902b5d7055b6bf46596cf424912d86a3e;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcl_logging_interface rcpputils rcutils spdlog_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "spdlog" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common performance_test_fixture ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Implementation of rcl_logging API for an spdlog backend.";
  };
}
