{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rclcpp_lifecycle,
  ros_testing,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    lifecycle = substituteSource {
      src = fetchgit {
        name = "lifecycle-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "7e5f9531f4afd9fa10ac2778386cea8e0d0fff7f";
        hash = "sha256-FsE0FfTIL0evPmqz06a7A/9RYzRqIwKo3UeE0l+vUgo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lifecycle";
  version = "0.34.2-1";
  src = sources.lifecycle;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rclcpp rclcpp_lifecycle std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ros_testing ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing demos for lifecycle implementation";
  };
}
