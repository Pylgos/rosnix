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
  propagatedNativeBuildInputs = [ cv-bridge image-geometry ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-geometry ];
  passthru.sources = mkSourceSet (sources: {
    "vision_opencv" = substituteSource {
      src = fetchgit {
        name = "vision_opencv-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "f0ccbe01e1591e4920c51cda62e6c7e805d85f94";
        hash = "sha256-PwJir9LBkybRtAwNZwGQr1ZxvFm4f+Id0qbqJNMEokk=";
      };
    };
  });
  meta = {
    description = "Packages for interfacing ROS2 with OpenCV, a library of programming functions for real time computer vision.";
  };
})
