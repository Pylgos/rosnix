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
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_timer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_timer" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_timer-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "8ccfde6efcf379fe568a24dfd552ad2eef07003f";
        hash = "sha256-uXaIMpc0z/lqqhOahATIjbp47EVX2QjQNIJPYEDWCuA=";
      };
    };
  });
  meta = {
    description = "Examples of minimal nodes which have timers";
  };
})
