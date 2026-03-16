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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_2d_overlay_plugins";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."rviz_2d_overlay_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rviz-2d-overlay-msgs rviz-common rviz-ogre-vendor rviz-rendering std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rviz-2d-overlay-msgs rviz-common rviz-ogre-vendor rviz-rendering std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz_2d_overlay_plugins" = substituteSource {
      src = fetchgit {
        name = "rviz_2d_overlay_plugins-source";
        url = "https://github.com/ros2-gbp/rviz_2d_overlay_plugins-release.git";
        rev = "905c9e33b8d3ba2a7b77f52a845f4c0577b5470c";
        hash = "sha256-RS/qtO4MzFi1hpkxPoPOORgUtW8Npop67MZKCW8mmGA=";
      };
    };
  });
  meta = {
    description = "RViz2 plugin for 2D overlays in the 3D view. Mainly a ROS2 port of the JSK overlay plugin\n        (https://github.com/jsk-ros-pkg/jsk_visualization).\n    ";
  };
})
