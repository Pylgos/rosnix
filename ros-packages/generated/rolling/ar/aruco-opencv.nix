{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-cpplint,
  ament-cmake-lint-cmake,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  aruco-opencv-msgs,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "aruco_opencv";
  version = "6.1.1-1";
  src = finalAttrs.passthru.sources."aruco_opencv";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ aruco-opencv-msgs cv-bridge image-transport rclcpp rclcpp-components rclcpp-lifecycle tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-img2pdf" "python3-numpy" "python3-opencv" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ aruco-opencv-msgs cv-bridge image-transport rclcpp rclcpp-components rclcpp-lifecycle tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-img2pdf" "python3-numpy" "python3-opencv" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "aruco_opencv" = substituteSource {
      src = fetchgit {
        name = "aruco_opencv-source";
        url = "https://github.com/ros2-gbp/aruco_opencv-release.git";
        rev = "4b543e6d8b77fc9a7b2b08dc79e024e86eedd10d";
        hash = "sha256-La8ZCTtOHYkVo435Bj1x7oeM2dfWAJnMFIWfe9F9oQ0=";
      };
    };
  });
  meta = {
    description = "\n    ArUco marker detection using aruco module from OpenCV libraries.\n  ";
  };
})
