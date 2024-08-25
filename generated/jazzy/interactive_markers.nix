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
        rev = "0e209ec4bf7d7ab5eaf38ebe8d9375a04cf49eb0";
        hash = "sha256-AnynI7NBpQeYuWFq0tNqFBkjlyKyY5BekFPSGeZbmrs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "interactive_markers";
  version = "2.5.4-2";
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
