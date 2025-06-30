{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot3-aruco-tracker,
  turtlebot3-automatic-parking,
  turtlebot3-automatic-parking-vision,
  turtlebot3-follower,
  turtlebot3-panorama,
  turtlebot3-yolo-object-detection,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_applications";
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."turtlebot3_applications";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ turtlebot3-aruco-tracker turtlebot3-automatic-parking turtlebot3-automatic-parking-vision turtlebot3-follower turtlebot3-panorama turtlebot3-yolo-object-detection ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot3-aruco-tracker turtlebot3-automatic-parking turtlebot3-automatic-parking-vision turtlebot3-follower turtlebot3-panorama turtlebot3-yolo-object-detection ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_applications" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_applications-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "c9d92940e316e2ca57034ae0d5bb347f4984122d";
        hash = "sha256-4AGzQcAQb96LhoSjfJSYJy+K403vYh4KTH7lFr7Y2To=";
      };
    };
  });
  meta = {
    description = "\n    ROS packages for the turtlebot3 applications (meta package)\n  ";
  };
})
