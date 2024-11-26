{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  picknik-ament-copyright,
  rclcpp,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "topic_based_ros2_control";
  version = "0.2.0-3";
  src = finalAttrs.passthru.sources."topic_based_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles hardware-interface rclcpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common picknik-ament-copyright ros2-control-test-assets ];
  passthru = {
    sources = mkSourceSet (sources: {
      "topic_based_ros2_control" = substituteSource {
        src = fetchgit {
          name = "topic_based_ros2_control-source";
          url = "https://github.com/ros2-gbp/topic_based_ros2_control-release.git";
          rev = "26c2db948ee965568b80e037bfa57e6cb85f87a0";
          hash = "sha256-SEfc/iqNZsxrD/m/f0CKmIfgo4mFGeziwqBv/ZXj1lM=";
        };
      };
    });
  };
  meta = {
    description = "ros2 control hardware interface for topic_based sim";
  };
})
