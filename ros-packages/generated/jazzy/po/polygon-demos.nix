{
  ament-cmake,
  angles,
  buildRosPackage,
  color-util,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  polygon-msgs,
  polygon-rviz-plugins,
  polygon-utils,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "polygon_demos" = substituteSource {
      src = fetchgit {
        name = "polygon_demos-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "9e17055840027168be00de88ebd3c201cf4ba67e";
        hash = "sha256-0p5CmgvpCwgYTqq1/egNbK/tMR5x1wX9GTj0/VpxTYs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "polygon_demos";
  version = "1.1.0-1";
  src = sources."polygon_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles color-util geometry-msgs polygon-msgs polygon-rviz-plugins polygon-utils rclcpp rviz2 rviz-common rviz-default-plugins ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Demo of polygon_rviz_plugins";
  };
}
