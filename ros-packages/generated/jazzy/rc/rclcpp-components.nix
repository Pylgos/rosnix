{
  ament-cmake-google-benchmark,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  class-loader,
  composition-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclcpp_components";
  version = "28.1.5-1";
  src = finalAttrs.passthru.sources."rclcpp_components";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp class-loader composition-interfaces rclcpp rcpputils ];
  checkInputs = [ ament-cmake-google-benchmark ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rclcpp_components" = substituteSource {
        src = fetchgit {
          name = "rclcpp_components-source";
          url = "https://github.com/ros2-gbp/rclcpp-release.git";
          rev = "cc0f4043f5e4c90ce9c6e1a6345ecff5d74773ff";
          hash = "sha256-W2Jh7P63lv44bA2K/9LmEY0MbhdeXt+9btCmBgt5VME=";
        };
      };
    });
  };
  meta = {
    description = "Package containing tools for dynamically loadable components";
  };
})
