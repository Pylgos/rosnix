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
  rosSystemPackages,
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
    nav2_util-6492242b8d0928be620a9e5e5642dcda59da41db = substituteSource {
      src = fetchgit {
        name = "nav2_util-6492242b8d0928be620a9e5e5642dcda59da41db-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "6492242b8d0928be620a9e5e5642dcda59da41db";
        hash = "sha256-6u+FXfsXDlMcYfZjJy27TrFFUak4cCRrSK3vq7LGC1A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_util";
  version = "1.3.2-1";
  src = sources.nav2_util-6492242b8d0928be620a9e5e5642dcda59da41db;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ bond bondcpp builtin_interfaces geometry_msgs lifecycle_msgs nav2_common nav2_msgs nav_msgs rcl_interfaces rclcpp rclcpp_action rclcpp_lifecycle std_msgs tf2 tf2_geometry_msgs tf2_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common std_srvs test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Nav2 utilities";
  };
}
