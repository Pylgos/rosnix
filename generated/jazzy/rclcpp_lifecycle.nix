{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  mimick_vendor,
  performance_test_fixture,
  rcl,
  rcl_interfaces,
  rcl_lifecycle,
  rclcpp,
  rcpputils,
  rcutils,
  rmw,
  rosidl_typesupport_cpp,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rclcpp_lifecycle = substituteSource {
      src = fetchgit {
        name = "rclcpp_lifecycle-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "b50a695cff11e4b66396a085402cd1941026c99a";
        hash = "sha256-hCCQTOIRdRogRVkgwucRmR4n2FyuHpRDGSd4GMCot2s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_lifecycle";
  version = "28.1.4-1";
  src = sources.rclcpp_lifecycle;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rcl rcl_interfaces rcl_lifecycle rclcpp rcutils rmw rosidl_typesupport_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common mimick_vendor performance_test_fixture rcpputils test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing a prototype for lifecycle implementation";
  };
}
