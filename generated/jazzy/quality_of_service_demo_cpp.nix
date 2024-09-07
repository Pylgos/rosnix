{
  ament_cmake,
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
  rclcpp,
  rclcpp_components,
  rcutils,
  rmw,
  rmw_implementation_cmake,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    quality_of_service_demo_cpp = substituteSource {
      src = fetchgit {
        name = "quality_of_service_demo_cpp-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "df700e3cb17eb057da4e7abe1230ffce08ed51d5";
        hash = "sha256-HNcDL/KHSIWlJ2YyOByfe7Ipi2Dm8+h0fuzTYhwdRWE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "quality_of_service_demo_cpp";
  version = "0.33.5-1";
  src = sources.quality_of_service_demo_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rmw_implementation_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces launch_ros rclcpp rclcpp_components rcutils rmw sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common launch launch_testing ];
  missingDependencies = [  ];
  meta = {
    description = "C++ Demo applications for Quality of Service features";
  };
}
