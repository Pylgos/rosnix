{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    dolly_follow = substituteSource {
      src = fetchgit {
        name = "dolly_follow-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "7db99e14c778dbbdcac5f5eb4d6e3e732972764e";
        hash = "sha256-Udj2U+dWE5+JIz9GOSB6X4C9y3g/g30Jp3+BTuiiRX0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dolly_follow";
  version = "0.4.0-5";
  src = sources.dolly_follow;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclcpp sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Follow node for Dolly, the robot sheep.";
  };
}
