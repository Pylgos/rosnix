{
  action-msgs,
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
  version = "29.3.0-1";
  src = finalAttrs.passthru.sources."rclcpp_action";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ action-msgs rcl rcl-action rclcpp rcpputils rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_action" = substituteSource {
      src = fetchgit {
        name = "rclcpp_action-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "e0e5640d776ba5accd318b8d9332e27d9ccc9928";
        hash = "sha256-6tvCG/QAh6DojGwSEq56ijUiwIOz89ngJfIk/kgkmIg=";
      };
    };
  });
  meta = {
    description = "Adds action APIs for C++.";
  };
})
