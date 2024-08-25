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
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    flex_sync = substituteSource {
      src = fetchgit {
        name = "flex_sync-source";
        url = "https://github.com/ros2-gbp/flex_sync-release.git";
        rev = "96e1e5af12f61327a7453551c34e6ecc2d6fb750";
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
  src = sources.flex_sync;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_clang_format rclcpp rclcpp_components rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_clang_format ament_cmake_clang_format ament_cmake_gtest ament_lint_auto ament_lint_common geometry_msgs std_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "ros2 package for syncing variable number of topics";
  };
}
