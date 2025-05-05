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
  version = "29.6.0-1";
  src = finalAttrs.passthru.sources."rclcpp_action";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl rcl-action rclcpp rcpputils ];
  propagatedBuildInputs = [ action-msgs rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_action" = substituteSource {
      src = fetchgit {
        name = "rclcpp_action-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "9cad0911806b25c9046756e97531ae77a2bc7963";
        hash = "sha256-VW9yEWIgjMKXtF2HvDt2hJLsvYxsv3vBBJYfXo/TvQA=";
      };
    };
  });
  meta = {
    description = "Adds action APIs for C++.";
  };
})
