{
  ament-cmake,
  ament-cmake-ros-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2lifecycle_test_fixtures";
  version = "0.41.0-1";
  src = finalAttrs.passthru.sources."ros2lifecycle_test_fixtures";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedBuildInputs = [ rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2lifecycle_test_fixtures" = substituteSource {
      src = fetchgit {
        name = "ros2lifecycle_test_fixtures-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "285b6af46b9007ee83bcfabb21412700ac86be19";
        hash = "sha256-5hhVby/Y3UJC0QNcCDKYXtL8GZdkGhhGUrj9Vo51Yr4=";
      };
    };
  });
  meta = {
    description = "Package containing fixture nodes for ros2lifecycle tests";
  };
})
