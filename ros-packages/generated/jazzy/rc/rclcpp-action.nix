{
  action-msgs,
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mimick-vendor,
  mkSourceSet,
  performance-test-fixture,
  rcl,
  rcl-action,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  rosidl-runtime-c,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclcpp_action";
  version = "28.1.5-1";
  src = finalAttrs.passthru.sources."rclcpp_action";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs rcl rcl-action rclcpp rcpputils rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_action" = substituteSource {
      src = fetchgit {
        name = "rclcpp_action-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "beccbe56c6180ed32d6eb0062099e8e238fa585f";
        hash = "sha256-ANnYhYXfDfNXuNjWCHyetQp0s8OV7bX50bN7sfqqLE4=";
      };
    };
  });
  meta = {
    description = "Adds action APIs for C++.";
  };
})
