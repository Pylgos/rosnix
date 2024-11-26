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
  pname = "examples_rclcpp_multithreaded_executor";
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_multithreaded_executor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclcpp_multithreaded_executor" = substituteSource {
        src = fetchgit {
          name = "examples_rclcpp_multithreaded_executor-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "b83880ead54e3b57624cd01f47b202e0528feb5a";
          hash = "sha256-jhpjPh8i4xGHbzlbMX62igBfRFYBNYTAFnaKZCIDjx4=";
        };
      };
    });
  };
  meta = {
    description = "Package containing example of how to implement a multithreaded executor";
  };
})
