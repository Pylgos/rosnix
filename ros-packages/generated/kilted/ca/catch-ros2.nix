{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros2launch,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "catch_ros2";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."catch_ros2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ros2launch std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ros2launch std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "catch_ros2" = substituteSource {
      src = fetchgit {
        name = "catch_ros2-source";
        url = "https://github.com/ros2-gbp/catch_ros2-release.git";
        rev = "b4543af2ad5e036a23f1a30dac41797d8d91d311";
        hash = "sha256-VItF/fteuNMuilpC6mXHUCohGA1NyzA6VqW0u+LfzYU=";
      };
    };
  });
  meta = {
    description = "Catch2 testing framework for ROS 2 unit and integration tests.";
  };
})
