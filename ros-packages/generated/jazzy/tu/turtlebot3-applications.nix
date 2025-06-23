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
  version = "1.3.2-1";
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
        rev = "f4817ef7a5df02ab4e0aead12ca4f0e0e0d33d94";
        hash = "sha256-5MXjxyhraMtStlRMEthLZH1OVifPRpAlWoAeJx623e4=";
      };
    };
  });
  meta = {
    description = "\n    ROS packages for the turtlebot3 applications (meta package)\n  ";
  };
})
