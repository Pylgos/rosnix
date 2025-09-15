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
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rcpputils,
  rmw,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclcpp_components";
  version = "30.1.1-1";
  src = finalAttrs.passthru.sources."rclcpp_components";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-index-cpp class-loader composition-interfaces rcl-interfaces rclcpp rcpputils rmw ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp class-loader composition-interfaces rcl-interfaces rclcpp rcpputils rmw ];
  checkInputs = [ ament-cmake-google-benchmark ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_components" = substituteSource {
      src = fetchgit {
        name = "rclcpp_components-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "e02563453747e9d4a61d59b75ee0a45ac4451635";
        hash = "sha256-Uz7BJj2rHBh2jOOH74X7n8KzolPOCruP5ZhgONzmlK4=";
      };
    };
  });
  meta = {
    description = "Package containing tools for dynamically loadable components";
  };
})
