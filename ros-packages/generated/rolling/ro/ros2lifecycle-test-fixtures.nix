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
  version = "0.37.0-1";
  src = finalAttrs.passthru.sources."ros2lifecycle_test_fixtures";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2lifecycle_test_fixtures" = substituteSource {
      src = fetchgit {
        name = "ros2lifecycle_test_fixtures-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "aa3e75d818d4cf71800be92d8d5bb9d0e358b7c0";
        hash = "sha256-FZ9Ri7LDDDa9D9CAHw1hKLZoCvvNmwe0Kr6aUcOFZxs=";
      };
    };
  });
  meta = {
    description = "Package containing fixture nodes for ros2lifecycle tests";
  };
})
