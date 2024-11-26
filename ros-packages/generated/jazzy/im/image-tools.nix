{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  version = "0.33.5-1";
  src = finalAttrs.passthru.sources."image_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-ros launch-testing launch-testing-ament-cmake launch-testing-ros rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "image_tools" = substituteSource {
      src = fetchgit {
        name = "image_tools-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "e53f2dfe1be71d79d0cddf23b4e7f61bb33ba97d";
        hash = "sha256-hRy5xFGeKMfoRZT1Od8NONXd3wCtorOEaYHJCHMrUH4=";
      };
    };
  });
  meta = {
    description = "Tools to capture and play back images to and from DDS subscriptions and publications.";
  };
})
