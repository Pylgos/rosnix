{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  bondcpp,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lifecycle_msgs,
  mkSourceSet,
  nav2_common,
  nav2_msgs,
  nav2_util,
  rclcpp_action,
  rclcpp_lifecycle,
  rosSystemPackages,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_geometry_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "nav2_lifecycle_manager" = substituteSource {
      src = fetchgit {
        name = "nav2_lifecycle_manager-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "b7c8655c4a6cb1cc31625fc1c9bad1ec4040ac07";
        hash = "sha256-bSmjWv5KmPZCdLOYkhg8JPjLBV9yE663Pk9+8bjD5L8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nav2_lifecycle_manager";
  version = "1.3.2-1";
  src = sources."nav2_lifecycle_manager";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ bondcpp diagnostic_updater geometry_msgs lifecycle_msgs nav2_common nav2_msgs nav2_util rclcpp_action rclcpp_lifecycle std_msgs std_srvs tf2_geometry_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A controller/manager for the lifecycle nodes of the Navigation 2 system";
  };
}
