{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  bond,
  bondcpp,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lifecycle_msgs,
  nav2_common,
  nav2_msgs,
  nav_msgs,
  rcl_interfaces,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  std_msgs,
  std_srvs,
  substituteSource,
  test_msgs,
  tf2,
  tf2_geometry_msgs,
  tf2_msgs,
  tf2_ros,
}:
let
  sources = rec {
    nav2_util = substituteSource {
      src = fetchgit {
        name = "nav2_util-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "462e2d833665521819d17620af65080188e7a9d2";
        hash = "sha256-hSroNMArBIOdRu0xsksZso/CPpayQRffKAY2X8Cr5Oo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_util";
  version = "1.3.1-1";
  src = sources.nav2_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bond bondcpp builtin_interfaces geometry_msgs lifecycle_msgs nav2_common nav2_msgs nav_msgs rcl_interfaces rclcpp rclcpp_action rclcpp_lifecycle std_msgs tf2 tf2_geometry_msgs tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common std_srvs test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Nav2 utilities";
  };
}
