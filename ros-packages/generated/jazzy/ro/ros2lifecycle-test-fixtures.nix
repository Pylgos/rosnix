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
  version = "0.32.1-1";
  src = finalAttrs.passthru.sources."ros2lifecycle_test_fixtures";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2lifecycle_test_fixtures" = substituteSource {
        src = fetchgit {
          name = "ros2lifecycle_test_fixtures-source";
          url = "https://github.com/ros2-gbp/ros2cli-release.git";
          rev = "ea85fa884c6417acf21d1d7e858f5379bc8e8b9c";
          hash = "sha256-L4zZbd8fMvXvo0n2Jf5wgcEM3qVeA0Hg0YgjMaWtXVo=";
        };
      };
    });
  };
  meta = {
    description = "Package containing fixture nodes for ros2lifecycle tests";
  };
})
