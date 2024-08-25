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
  spdlog,
  spdlog_vendor,
  substituteSource,
}:
let
  sources = rec {
    rcl_logging_spdlog = substituteSource {
      src = fetchgit {
        name = "rcl_logging_spdlog-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "4f719b39b3a71e82677f4a3937be8516957d3d3a";
        hash = "sha256-dOCG1y9kG6RADBDWbKM889bAxOsFn9NVhrhyYcUZ+xI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_spdlog";
  version = "3.2.1-1";
  src = sources.rcl_logging_spdlog;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_logging_interface rcpputils rcutils spdlog spdlog_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common performance_test_fixture ];
  missingDependencies = [  ];
  meta = {
    description = "Implementation of rcl_logging API for an spdlog backend.";
  };
}
