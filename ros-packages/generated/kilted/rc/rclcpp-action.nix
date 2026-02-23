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
  version = "29.5.7-1";
  src = finalAttrs.passthru.sources."rclcpp_action";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ action-msgs rcl rcl-action rclcpp rcpputils rosidl-runtime-c ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ action-msgs rcl rcl-action rclcpp rcpputils rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_action" = substituteSource {
      src = fetchgit {
        name = "rclcpp_action-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "b1e7597c4d21967024194634acacfd62d7c1b9aa";
        hash = "sha256-DWAW87pEpd8G9JViU8WoV5ByDyXZiUS8Czsion6ZUkQ=";
      };
    };
  });
  meta = {
    description = "Adds action APIs for C++.";
  };
})
