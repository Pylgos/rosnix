{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "vision_opencv";
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."vision_opencv";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-geometry ];
  passthru.sources = mkSourceSet (sources: {
    "vision_opencv" = substituteSource {
      src = fetchgit {
        name = "vision_opencv-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "644863a3ee32533e12bc5ce511a5cdb41ae27620";
        hash = "sha256-PwJir9LBkybRtAwNZwGQr1ZxvFm4f+Id0qbqJNMEokk=";
      };
    };
  });
  meta = {
    description = "Packages for interfacing ROS2 with OpenCV, a library of programming functions for real time computer vision.";
  };
})
