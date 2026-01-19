{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo-example-follow-aruco-marker,
  leo-example-line-follower,
  leo-example-object-detection,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_examples";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."leo_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ leo leo-example-follow-aruco-marker leo-example-line-follower leo-example-object-detection ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo leo-example-follow-aruco-marker leo-example-line-follower leo-example-object-detection ];
  passthru.sources = mkSourceSet (sources: {
    "leo_examples" = substituteSource {
      src = fetchgit {
        name = "leo_examples-source";
        url = "https://github.com/ros2-gbp/leo_examples-ros2-release.git";
        rev = "fec6d01638bf4f57330a725b2c685e14708ed5a6";
        hash = "sha256-UzNIw471PYhMvP2MTRtIBoaHHR/lsuil5BikPNhVO5M=";
      };
    };
  });
  meta = {
    description = "\n    A collection of ROS2 packages that show an example usage of functionalities on a stock Leo Rover.\n  ";
  };
})
