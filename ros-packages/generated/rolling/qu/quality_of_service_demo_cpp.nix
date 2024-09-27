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
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    quality_of_service_demo_cpp-4a43a53418c304b8340f7e9854df7c7b8cf9f73e = substituteSource {
      src = fetchgit {
        name = "quality_of_service_demo_cpp-4a43a53418c304b8340f7e9854df7c7b8cf9f73e-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "4a43a53418c304b8340f7e9854df7c7b8cf9f73e";
        hash = "sha256-xZw+YrqZKW3zb2/D4WbBch4QPBxasrn+fpB8XZM/V5E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "quality_of_service_demo_cpp";
  version = "0.34.2-1";
  src = sources.quality_of_service_demo_cpp-4a43a53418c304b8340f7e9854df7c7b8cf9f73e;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rmw_implementation_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example_interfaces launch_ros rclcpp rclcpp_components rcutils rmw sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common launch launch_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ Demo applications for Quality of Service features";
  };
}
