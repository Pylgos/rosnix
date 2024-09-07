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
        rev = "1823823205a089832815e05640dad53767409e21";
        hash = "sha256-VHQgUWaJSHvx2KXRHjClZcq/8Ev3gBFQzXfavsmv8Lc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lifecycle";
  version = "0.33.5-1";
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
