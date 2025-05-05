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
  version = "6.0.1-1";
  src = finalAttrs.passthru.sources."aruco_opencv";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ aruco-opencv-msgs cv-bridge image-transport rclcpp-components tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-img2pdf" "python3-numpy" "python3-opencv" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "aruco_opencv" = substituteSource {
      src = fetchgit {
        name = "aruco_opencv-source";
        url = "https://github.com/ros2-gbp/aruco_opencv-release.git";
        rev = "8a6e6a56f544b99eb6c8be848f1a5a4b9a463d9b";
        hash = "sha256-SidyRIeaYeAZTr6h04wPmYBWhR8Z1YIGnV35sjdHmGY=";
      };
    };
  });
  meta = {
    description = "ArUco marker detection using aruco module from OpenCV libraries.";
  };
})
