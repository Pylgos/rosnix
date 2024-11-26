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
  version = "0.19.4-1";
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
          rev = "198bc59389c12b3dcd106d51cacdc722d6afb5d2";
          hash = "sha256-U2cq59Pmhxel0vHc1C8RuXzQJTZ5k/qKW1Hi9lVIauc=";
        };
      };
    });
  };
  meta = {
    description = "Package containing example of how to implement a multithreaded executor";
  };
})
