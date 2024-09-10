{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  joy,
  launch_ros,
  launch_testing_ament_cmake,
  launch_testing_ros,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    teleop_twist_joy = substituteSource {
      src = fetchgit {
        name = "teleop_twist_joy-source";
        url = "https://github.com/ros2-gbp/teleop_twist_joy-release.git";
        rev = "41b9472e97d23db558b1a395be1108dc93dcfad7";
        hash = "sha256-nB0va0g6TkrL+6KcyPKFB7ft9opzePCbv4kYmx7f6ug=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "teleop_twist_joy";
  version = "2.6.2-1";
  src = sources.teleop_twist_joy;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs joy rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common launch_ros launch_testing_ament_cmake launch_testing_ros ];
  missingDependencies = [  ];
  meta = {
    description = "Generic joystick teleop for twist robots.";
  };
}
