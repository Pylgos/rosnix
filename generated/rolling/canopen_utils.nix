{
  ament_lint_auto,
  buildRosPackage,
  canopen_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclpy,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    canopen_utils = substituteSource {
      src = fetchFromGitHub {
        name = "canopen_utils-source";
        owner = "ros2-gbp";
        repo = "ros2_canopen-release";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ canopen_interfaces lifecycle_msgs rclpy std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Utils for working with ros2_canopen.";
  };
}
