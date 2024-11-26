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
  version = "29.2.0-1";
  src = finalAttrs.passthru.sources."rclcpp_components";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp class-loader composition-interfaces rclcpp rcpputils ];
  checkInputs = [ ament-cmake-google-benchmark ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_components" = substituteSource {
      src = fetchgit {
        name = "rclcpp_components-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "ff1f2991e649947aa7b84b37a07f427a709b9f1f";
        hash = "sha256-5n7Ld17LCn7wtdZ5PUqcj5wdOjfBWKUFaYOvfCRHiNQ=";
      };
    };
  });
  meta = {
    description = "Package containing tools for dynamically loadable components";
  };
})
