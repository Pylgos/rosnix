{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sdl2_vendor,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    joy = substituteSource {
      src = fetchFromGitHub {
        name = "joy-source";
        owner = "ros2-gbp";
        repo = "joystick_drivers-release";
        rev = "67a9a49bc8f5af4f3bb4631169fb4364ec3bbb42";
        hash = "sha256-D1K9/q5C0I7lztfZMomXMVDmBUV0UKvl2iNljHx2pPY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joy";
  version = "3.3.0-3";
  src = sources.joy;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components sdl2_vendor sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The joy package contains joy_node, a node that interfaces a generic joystick to ROS 2. This node publishes a \"Joy\" message, which contains the current state of each one of the joystick's buttons and axes.";
  };
}
