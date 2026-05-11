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
  version = "33.0.0-1";
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
        rev = "9e8d5b2df1ef6e08240916c5ba4db8746e1412da";
        hash = "sha256-3Roj/hMmYt6fbpImmp4ZPKjDPEKe9VyC5sFNeD6KtWk=";
      };
    };
  });
  meta = {
    description = "Package containing tools for dynamically loadable components";
  };
})
