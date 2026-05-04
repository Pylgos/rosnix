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
  version = "0.21.5-2";
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
        rev = "02b9c7a52be4341035f05cbbb3cbd194057c2f0d";
        hash = "sha256-UGZHq6a746gBka2iXcih2KdsY8Bjp+6R5VC9iOgJYt0=";
      };
    };
  });
  meta = {
    description = "Examples of minimal nodes which have timers";
  };
})
