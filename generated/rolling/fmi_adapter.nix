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
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    fmi_adapter = substituteSource {
      src = fetchgit {
        name = "fmi_adapter-source";
        url = "https://github.com/ros2-gbp/fmi_adapter-release.git";
        rev = "4d5abe287d3113eed130e46e8f4c0cab8fa90d14";
        hash = "sha256-bdDksqaZAqG/5URM3Ifb8DOvHvjwqqadN4eguWTN3Vk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fmi_adapter";
  version = "2.1.2-2";
  src = sources.fmi_adapter;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fmilibrary_vendor launch launch_ros rcl_interfaces rclcpp rclcpp_components rclcpp_lifecycle std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch_testing rcutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wraps FMUs for co-simulation";
  };
}
