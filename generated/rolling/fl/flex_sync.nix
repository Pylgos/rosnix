{
  ament_clang_format,
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    flex_sync-c9912ffa6d31b5704c13c376b92c0c201fa7ad30 = substituteSource {
      src = fetchgit {
        name = "flex_sync-c9912ffa6d31b5704c13c376b92c0c201fa7ad30-source";
        url = "https://github.com/ros2-gbp/flex_sync-release.git";
        rev = "c9912ffa6d31b5704c13c376b92c0c201fa7ad30";
        hash = "sha256-DRj8hRb5f02ZdXinTOUCOnVQRMHJS/Es67wgVFdZmUs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flex_sync";
  version = "2.0.0-1";
  src = sources.flex_sync-c9912ffa6d31b5704c13c376b92c0c201fa7ad30;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_clang_format rclcpp rclcpp_components rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_clang_format ament_cmake_clang_format ament_cmake_gtest ament_lint_auto ament_lint_common geometry_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros2 package for syncing variable number of topics";
  };
}
