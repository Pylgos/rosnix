{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-python,
  ament-cmake-xmllint,
  ament-lint-auto,
  aruco-opencv,
  aruco-opencv-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclpy,
  rosSystemPackages,
  substituteSource,
  tf-transformations,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_example_follow_aruco_marker";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."leo_example_follow_aruco_marker";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ aruco-opencv aruco-opencv-msgs generate-parameter-library geometry-msgs nav-msgs rclpy tf-transformations ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ aruco-opencv aruco-opencv-msgs generate-parameter-library geometry-msgs nav-msgs rclpy tf-transformations ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_example_follow_aruco_marker" = substituteSource {
      src = fetchgit {
        name = "leo_example_follow_aruco_marker-source";
        url = "https://github.com/ros2-gbp/leo_examples-ros2-release.git";
        rev = "93bda1d4db0c6602d9df4bd0c5a4db82acd12900";
        hash = "sha256-bOJjoa3SzMiJV4HDDpXPMC4nhtu3fQIXzieZb+WRrCU=";
      };
    };
  });
  meta = {
    description = "\n    Follow Aruco Marker Example for Leo Rover.\n  ";
  };
})
