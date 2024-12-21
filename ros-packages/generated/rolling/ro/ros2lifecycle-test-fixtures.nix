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
  version = "0.36.1-1";
  src = finalAttrs.passthru.sources."ros2lifecycle_test_fixtures";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2lifecycle_test_fixtures" = substituteSource {
      src = fetchgit {
        name = "ros2lifecycle_test_fixtures-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "e3631a099d5eb066391943526c53170f8a0fa0fb";
        hash = "sha256-OHuKkKfMMScHuGM6GZ8a2ojtBRQ22m7Dewmph2e0Xds=";
      };
    };
  });
  meta = {
    description = "Package containing fixture nodes for ros2lifecycle tests";
  };
})
