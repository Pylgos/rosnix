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
  version = "28.1.12-1";
  src = finalAttrs.passthru.sources."rclcpp_action";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ action-msgs ament-cmake rcl rcl-action rclcpp rcpputils rosidl-runtime-c ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ action-msgs ament-cmake rcl rcl-action rclcpp rcpputils rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_action" = substituteSource {
      src = fetchgit {
        name = "rclcpp_action-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "41a0cae77806a31e57fb2beed252c248e9aa972a";
        hash = "sha256-QtVtoyATRPrNHD6l1k1bjgqAQ/6Unv2JW4ZtfPyRmPg=";
      };
    };
  });
  meta = {
    description = "Adds action APIs for C++.";
  };
})
