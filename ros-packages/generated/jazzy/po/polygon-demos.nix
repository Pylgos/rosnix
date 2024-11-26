{
  ament-cmake,
  angles,
  buildAmentCmakePackage,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "polygon_demos";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."polygon_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ angles color-util geometry-msgs polygon-msgs polygon-rviz-plugins polygon-utils rclcpp rviz2 rviz-common rviz-default-plugins ];
  passthru = {
    sources = mkSourceSet (sources: {
      "polygon_demos" = substituteSource {
        src = fetchgit {
          name = "polygon_demos-source";
          url = "https://github.com/ros2-gbp/polygon_ros-release.git";
          rev = "9e17055840027168be00de88ebd3c201cf4ba67e";
          hash = "sha256-0p5CmgvpCwgYTqq1/egNbK/tMR5x1wX9GTj0/VpxTYs=";
        };
      };
    });
  };
  meta = {
    description = "Demo of polygon_rviz_plugins";
  };
})
