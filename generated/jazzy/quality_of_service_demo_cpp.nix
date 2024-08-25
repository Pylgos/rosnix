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
        rev = "f852dcbe304b496852fef35c01091e9a1ea98874";
        hash = "sha256-eV322lS9mlCw4J9vxnObcwuusY4ldrt84WgCVkFjcAI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "quality_of_service_demo_cpp";
  version = "0.33.4-1";
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
