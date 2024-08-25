{
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  rcl_logging_interface,
  rcutils,
  substituteSource,
}:
let
  sources = rec {
    rcl_logging_noop = substituteSource {
      src = fetchgit {
        name = "rcl_logging_noop-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "c5b1b8992fa5846b0716e38d06a336636c6c57cd";
        hash = "sha256-7R7qMZbB/S8j8K8OZWBnbarTGZ6LrA/i66EoGJ8Nbq8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_noop";
  version = "3.2.1-1";
  src = sources.rcl_logging_noop;
  nativeBuildInputs = [ ament_cmake_ros buildPackages.python3Packages.empy ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_logging_interface rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common launch_testing ];
  missingDependencies = [  ];
  meta = {
    description = "An rcl logger implementation that doesn't do anything with log messages.";
  };
}
