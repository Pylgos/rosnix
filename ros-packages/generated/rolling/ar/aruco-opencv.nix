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
  version = "6.0.2-1";
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
        rev = "29179b9acd4c1e8e1a33c29058afa8884d4e851a";
        hash = "sha256-KFgUGhlYkf3wCY+yFv5vX/7yKMYpyci7yOaq3LYuSGE=";
      };
    };
  });
  meta = {
    description = "\n    ArUco marker detection using aruco module from OpenCV libraries.\n  ";
  };
})
