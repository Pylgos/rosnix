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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_minimal_timer";
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_timer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_timer" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_timer-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "b86c7af609fd1346cdc9aa812e3996b8cd3dfcee";
        hash = "sha256-Q4yy+eCklK/JGVd5fHTU+tC44lgm8sy2GtyHnzMVYjM=";
      };
    };
  });
  meta = {
    description = "Examples of minimal nodes which have timers";
  };
})
