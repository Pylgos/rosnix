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
  version = "0.21.1-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_timer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_timer" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_timer-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "e2753fa571c0c107b587da302b15b90b4eaec463";
        hash = "sha256-ssp6uJn8UIZf4CjYxRKzX+yU8nKSty7/TWiYmlpaCcQ=";
      };
    };
  });
  meta = {
    description = "Examples of minimal nodes which have timers";
  };
})
