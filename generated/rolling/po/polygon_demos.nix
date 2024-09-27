{
  ament_cmake,
  angles,
  buildRosPackage,
  color_util,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  polygon_msgs,
  polygon_rviz_plugins,
  polygon_utils,
  rclcpp,
  rosSystemPackages,
  rviz2,
  rviz_common,
  rviz_default_plugins,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    polygon_demos-5d861f84116cf5a590aef42476cd3e0d48178de1 = substituteSource {
      src = fetchgit {
        name = "polygon_demos-5d861f84116cf5a590aef42476cd3e0d48178de1-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "5d861f84116cf5a590aef42476cd3e0d48178de1";
        hash = "sha256-0p5CmgvpCwgYTqq1/egNbK/tMR5x1wX9GTj0/VpxTYs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_demos";
  version = "1.1.0-1";
  src = sources.polygon_demos-5d861f84116cf5a590aef42476cd3e0d48178de1;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles color_util geometry_msgs polygon_msgs polygon_rviz_plugins polygon_utils rclcpp rviz2 rviz_common rviz_default_plugins ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Demo of polygon_rviz_plugins";
  };
}
