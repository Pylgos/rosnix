{
  ament_lint_auto,
  buildRosPackage,
  canopen_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    canopen_utils = substituteSource {
      src = fetchgit {
        name = "canopen_utils-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "c38bf3af55d34689708018eef16f7292184343a0";
        hash = "sha256-OfjICf9OLX/o1eunv9wPjJ8Z0vrkW4xHaUe7/B32hAA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_utils";
  version = "0.2.12-2";
  src = sources.canopen_utils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_interfaces lifecycle_msgs rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Utils for working with ros2_canopen.";
  };
}
