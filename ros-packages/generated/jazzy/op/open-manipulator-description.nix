{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  realsense2-description,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_description";
  version = "4.1.3-1";
  src = finalAttrs.passthru.sources."open_manipulator_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui realsense2-description robot-state-publisher rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui realsense2-description robot-state-publisher rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_description" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_description-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "900db2d9b7ae8dba792d2c3cd46c12f2b7626f3b";
        hash = "sha256-JhWnW2oXk9+RKVd4ucv+mLsOTu4tx3t4c3ppYFStxvY=";
      };
    };
  });
  meta = {
    description = "\n    open_manipulator_description ROS 2 package.\n  ";
  };
})
