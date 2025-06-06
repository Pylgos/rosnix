{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  rplidar-ros,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "create3_lidar_slam";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."create3_lidar_slam";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ irobot-create-msgs launch-ros rplidar-ros slam-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-msgs launch-ros rplidar-ros slam-toolbox ];
  passthru.sources = mkSourceSet (sources: {
    "create3_lidar_slam" = substituteSource {
      src = fetchgit {
        name = "create3_lidar_slam-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "d4e05e13f1ea844bb4ab14dc41584f521370cc6b";
        hash = "sha256-iYwJwoKjMJYskalC2VgZqnpezqt/rJSEL6aLa5zvVxc=";
      };
    };
  });
  meta = {
    description = "Example for using an RPLIDAR A1 with a Create 3";
  };
})
