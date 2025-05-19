{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "self_test";
  version = "4.2.4-1";
  src = finalAttrs.passthru.sources."self_test";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater rclcpp ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater rclcpp ros-environment ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "self_test" = substituteSource {
      src = fetchgit {
        name = "self_test-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "e5b28e1edbe341c17f579111ab40c3b859c89192";
        hash = "sha256-YqWUUfCKzXkhXp/YU5R8EJ1Wy2D5mDFFNUc1ZhzDPjo=";
      };
    };
  });
  meta = {
    description = "self_test";
  };
})
