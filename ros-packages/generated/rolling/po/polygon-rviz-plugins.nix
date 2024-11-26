{
  ament-cmake,
  buildAmentCmakePackage,
  color-util,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  polygon-msgs,
  polygon-utils,
  rosSystemPackages,
  rviz-common,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "polygon_rviz_plugins";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."polygon_rviz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ color-util geometry-msgs pluginlib polygon-msgs polygon-utils rviz-common std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "polygon_rviz_plugins" = substituteSource {
        src = fetchgit {
          name = "polygon_rviz_plugins-source";
          url = "https://github.com/ros2-gbp/polygon_ros-release.git";
          rev = "2097ac05b3dd59f6df042b0a5ff94bbff63c9b26";
          hash = "sha256-kXUTcZF3KsFumuXqXCeIaMwhTxL4CWEfmRduy9+Uiq4=";
        };
      };
    });
  };
  meta = {
    description = "RViz visualizations for polygons";
  };
})
