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
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_cbg_executor";
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_cbg_executor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_cbg_executor" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_cbg_executor-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "b1cabea6bb545a43883f3ba55d9f28ac51e33c5c";
        hash = "sha256-H7nXiF0UBOg4BXT3g8DRatB6QBpeTm7IMDDmh/ndcd4=";
      };
    };
  });
  meta = {
    description = "Example for multiple Executor instances in one process, using the callback-group-level interface of the Executor class.";
  };
})
