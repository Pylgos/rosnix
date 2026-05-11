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
  version = "0.38.0-1";
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
        rev = "98e81b8ccbec97912b9f4340b7808932663acf34";
        hash = "sha256-3PFIsZyc83b1mI1n1lBKXWqEWZQOMRU4KVwZKlsvsXs=";
      };
    };
  });
  meta = {
    description = "Tools to capture and play back images to and from DDS subscriptions and publications.";
  };
})
