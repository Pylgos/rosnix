{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rcutils,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  turtlebot4-msgs,
  turtlebot4-node,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot4_base" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_base-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "0ed16058ed144ead0b4775a74bb023064a1ba8bf";
        hash = "sha256-arSKKAgRkiODcw8w+6xAJItPvOtjYVxpyvk8M7ZxgsA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "turtlebot4_base";
  version = "2.0.0-1";
  src = sources."turtlebot4_base";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ irobot-create-msgs rclcpp rclcpp-action rcutils sensor-msgs std-msgs turtlebot4-msgs turtlebot4-node ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgpiod-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Turtlebot4 Base Node";
  };
}
