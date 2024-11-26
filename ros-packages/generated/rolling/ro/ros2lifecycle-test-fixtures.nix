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
  version = "0.36.0-1";
  src = finalAttrs.passthru.sources."ros2lifecycle_test_fixtures";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2lifecycle_test_fixtures" = substituteSource {
      src = fetchgit {
        name = "ros2lifecycle_test_fixtures-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "3f77ff7ab7277186b5ef90c505b24876513b16da";
        hash = "sha256-3c40WR144YPmLV0c9EQPpROjZnBVgJJL016MuACVuHI=";
      };
    };
  });
  meta = {
    description = "Package containing fixture nodes for ros2lifecycle tests";
  };
})
