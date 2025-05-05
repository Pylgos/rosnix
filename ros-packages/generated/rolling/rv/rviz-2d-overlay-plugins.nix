{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rviz-2d-overlay-msgs,
  rviz-common,
  rviz-ogre-vendor,
  rviz-rendering,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_2d_overlay_plugins";
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."rviz_2d_overlay_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rviz-2d-overlay-msgs rviz-common rviz-ogre-vendor rviz-rendering std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rviz-2d-overlay-msgs rviz-common rviz-ogre-vendor rviz-rendering std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz_2d_overlay_plugins" = substituteSource {
      src = fetchgit {
        name = "rviz_2d_overlay_plugins-source";
        url = "https://github.com/ros2-gbp/rviz_2d_overlay_plugins-release.git";
        rev = "3b3590c19f305d919b9585c87115befcfb19e146";
        hash = "sha256-5KPjUMZyqAgUXuO87e61O6tTFRDf9qA4oCK56AOXXPE=";
      };
    };
  });
  meta = {
    description = "RViz2 plugin for 2D overlays in the 3D view. Mainly a ROS2 port of the JSK overlay plugin\n        (https://github.com/jsk-ros-pkg/jsk_visualization).\n    ";
  };
})
