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
  passthru.sources = mkSourceSet (sources: {
    "polygon_demos" = substituteSource {
      src = fetchgit {
        name = "polygon_demos-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "5d861f84116cf5a590aef42476cd3e0d48178de1";
        hash = "sha256-0p5CmgvpCwgYTqq1/egNbK/tMR5x1wX9GTj0/VpxTYs=";
      };
    };
  });
  meta = {
    description = "Demo of polygon_rviz_plugins";
  };
})
