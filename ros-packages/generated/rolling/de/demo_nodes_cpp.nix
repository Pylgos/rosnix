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
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    demo_nodes_cpp-8dd25250650cdd7eed98163c702a3b04e8c39be8 = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp-8dd25250650cdd7eed98163c702a3b04e8c39be8-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "8dd25250650cdd7eed98163c702a3b04e8c39be8";
        hash = "sha256-NN8WwR8UhYiOQ/BHsttNgM9KPgct2SMl2Eg0e33c0m0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "demo_nodes_cpp";
  version = "0.34.2-1";
  src = sources.demo_nodes_cpp-8dd25250650cdd7eed98163c702a3b04e8c39be8;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example_interfaces launch_ros launch_xml rcl rcl_interfaces rclcpp rclcpp_components rcpputils rcutils rmw std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake launch_testing_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ nodes which were previously in the ros2/examples repository but are now just used for demo purposes.";
  };
}
