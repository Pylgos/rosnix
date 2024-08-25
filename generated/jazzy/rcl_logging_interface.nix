{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcpputils,
  rcutils,
  substituteSource,
}:
let
  sources = rec {
    rcl_logging_interface = substituteSource {
      src = fetchgit {
        name = "rcl_logging_interface-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "0f02a66b68786b02e070f4e4a90d73f26f115413";
        hash = "sha256-r7WviMcNX31Wz2qwm6JYMErRwdpCCnHYKsXyqBxrTrc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_interface";
  version = "3.1.0-2";
  src = sources.rcl_logging_interface;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common rcpputils ];
  missingDependencies = [  ];
  meta = {
    description = "Interface that rcl_logging backends needs to implement.";
  };
}
