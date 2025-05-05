{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot4-base,
  turtlebot4-bringup,
  turtlebot4-diagnostics,
  turtlebot4-tests,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_robot";
  version = "2.0.1-2";
  src = finalAttrs.passthru.sources."turtlebot4_robot";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ turtlebot4-base turtlebot4-bringup turtlebot4-diagnostics turtlebot4-tests ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot4-base turtlebot4-bringup turtlebot4-diagnostics turtlebot4-tests ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_robot" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_robot-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "94ab12bc4ef6fabb9f79a38720d1dcedca945e5a";
        hash = "sha256-KEgcKewuGvzYKudi1W/Myo+vU8h+w4X78HtO4s+ss68=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Robot Metapackage";
  };
})
