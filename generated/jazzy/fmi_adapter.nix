{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmilibrary_vendor,
  launch,
  launch_ros,
  launch_testing,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rcutils,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    fmi_adapter = substituteSource {
      src = fetchgit {
        name = "fmi_adapter-source";
        url = "https://github.com/ros2-gbp/fmi_adapter-release.git";
        rev = "7cd1b63789fc2756d115d493ec4d79add7e8edc7";
        hash = "sha256-bdDksqaZAqG/5URM3Ifb8DOvHvjwqqadN4eguWTN3Vk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fmi_adapter";
  version = "2.1.2-1";
  src = sources.fmi_adapter;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmilibrary_vendor launch launch_ros rcl_interfaces rclcpp rclcpp_components rclcpp_lifecycle std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch_testing rcutils ];
  missingDependencies = [  ];
  meta = {
    description = "Wraps FMUs for co-simulation";
  };
}
