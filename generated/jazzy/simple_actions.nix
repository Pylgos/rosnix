{
  action_msgs,
  action_tutorials_interfaces,
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_action,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    simple_actions = substituteSource {
      src = fetchFromGitHub {
        name = "simple_actions-source";
        owner = "ros2-gbp";
        repo = "simple_actions-release";
        rev = "dd41ab8acc4fe0dfbb8f16305dcd4b8f21e64b11";
        hash = "sha256-BC5T9iKxbIolH0TXwEUcRhXO0b9xjFOdnM4+le2X27Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "simple_actions";
  version = "0.4.0-1";
  src = sources.simple_actions;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs rclcpp rclcpp_action rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ action_tutorials_interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Simple library for using the `rclpy/rclcpp` action libraries";
  };
}
