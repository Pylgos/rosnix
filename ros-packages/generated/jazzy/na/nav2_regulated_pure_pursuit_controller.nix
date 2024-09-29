{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "nav2_regulated_pure_pursuit_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_regulated_pure_pursuit_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "63fee1a413678f3e3486048d458c959fe254f822";
        hash = "sha256-h95hho/UqqE9r5MxhSzR2GQ/PLLzTmJTMO60j+wdzwA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nav2_regulated_pure_pursuit_controller";
  version = "1.3.2-1";
  src = sources."nav2_regulated_pure_pursuit_controller";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp tf2 tf2_geometry_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Regulated Pure Pursuit Controller";
  };
}