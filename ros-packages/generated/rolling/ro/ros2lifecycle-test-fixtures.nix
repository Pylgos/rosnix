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
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2lifecycle_test_fixtures";
  version = "0.40.1-1";
  src = finalAttrs.passthru.sources."ros2lifecycle_test_fixtures";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2lifecycle_test_fixtures" = substituteSource {
      src = fetchgit {
        name = "ros2lifecycle_test_fixtures-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "dcb4fe06b37c04450ea90fc3e5feeeb9e33c4226";
        hash = "sha256-Tsck/4HNIEi4gDDFKFbOIi/trY/B3DZOCbC41lRP7UE=";
      };
    };
  });
  meta = {
    description = "Package containing fixture nodes for ros2lifecycle tests";
  };
})
