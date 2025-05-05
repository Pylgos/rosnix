{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot3-autorace-camera,
  turtlebot3-autorace-detect,
  turtlebot3-autorace-mission,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_autorace";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_autorace";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ turtlebot3-autorace-camera turtlebot3-autorace-detect turtlebot3-autorace-mission ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot3-autorace-camera turtlebot3-autorace-detect turtlebot3-autorace-mission ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_autorace" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_autorace-source";
        url = "https://github.com/ros2-gbp/turtlebot3_autorace-release.git";
        rev = "d81a00f1f8282da8987957e59477dc0647c6db37";
        hash = "sha256-22j0cue+JdImsh5DESj683G+S17IHDzVPCwcwkiKfPk=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 meta packages for turtlebot3_autorace\n  ";
  };
})
