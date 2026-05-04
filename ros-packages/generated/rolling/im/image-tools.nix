{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rmw-implementation-cmake,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_tools";
  version = "0.37.8-2";
  src = finalAttrs.passthru.sources."image_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-core" "libopencv-dev" "libopencv-highgui" "libopencv-imgcodecs" "libopencv-imgproc" "libopencv-videoio" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-core" "libopencv-dev" "libopencv-highgui" "libopencv-imgcodecs" "libopencv-imgproc" "libopencv-videoio" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-ros launch-testing launch-testing-ament-cmake launch-testing-ros rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "image_tools" = substituteSource {
      src = fetchgit {
        name = "image_tools-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "6ad25b1741123d69d817fcb0638b197466699b9f";
        hash = "sha256-yvIxYIsMaKH7X8X9DQSUWBC4V0LBTmW+xLy8v4Hjw/w=";
      };
    };
  });
  meta = {
    description = "Tools to capture and play back images to and from DDS subscriptions and publications.";
  };
})
