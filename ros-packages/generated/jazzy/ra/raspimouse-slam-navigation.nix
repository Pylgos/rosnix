{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  raspimouse-navigation,
  raspimouse-slam,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_slam_navigation";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."raspimouse_slam_navigation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ raspimouse-navigation raspimouse-slam ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ raspimouse-navigation raspimouse-slam ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_slam_navigation" = substituteSource {
      src = fetchgit {
        name = "raspimouse_slam_navigation-source";
        url = "https://github.com/ros2-gbp/raspimouse_slam_navigation_ros2-release.git";
        rev = "acc1c15fa47b95abd9f0a987650fd6825065eea2";
        hash = "sha256-RWe7AeFTFeofc3rnV2g6ok5lhI2KdOdQTTXSMLSw540=";
      };
    };
  });
  meta = {
    description = "SLAM and navigation packages for Raspberry Pi Mouse V3";
  };
})
