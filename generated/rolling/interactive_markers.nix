{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclpy,
  rcutils,
  rmw,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    interactive_markers = substituteSource {
      src = fetchgit {
        name = "interactive_markers-source";
        url = "https://github.com/ros2-gbp/interactive_markers-release.git";
        rev = "eedadfa842252731443d1920512999b0003e90d8";
        hash = "sha256-06dOnCq2AwvRLOozJQWyA1fMmG3UuC3WuRoj11acimw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "interactive_markers";
  version = "2.6.1-1";
  src = sources.interactive_markers;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclcpp rclpy rcutils rmw std_msgs tf2 tf2_geometry_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common builtin_interfaces ];
  missingDependencies = [  ];
  meta = {
    description = "3D interactive marker communication library for RViz and similar tools.";
  };
}
