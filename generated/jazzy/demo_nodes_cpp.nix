{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  launch_xml,
  rcl,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  rcpputils,
  rcutils,
  rmw,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    demo_nodes_cpp = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "bd715f2561120dca20102b8364013325adfc80d3";
        hash = "sha256-pSrlqygi3kMfiMtOngfgsOyV8AIgis5TnO4/7lIdr78=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "demo_nodes_cpp";
  version = "0.33.4-1";
  src = sources.demo_nodes_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces launch_ros launch_xml rcl rcl_interfaces rclcpp rclcpp_components rcpputils rcutils rmw std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake launch_testing_ros ];
  missingDependencies = [  ];
  meta = {
    description = "C++ nodes which were previously in the ros2/examples repository but are now just used for demo purposes.";
  };
}
