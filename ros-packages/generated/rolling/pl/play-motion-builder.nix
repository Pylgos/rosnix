{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  play-motion-builder-msgs,
  play-motion2,
  play-motion2-msgs,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "play_motion_builder";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."play_motion_builder";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ play-motion2 play-motion2-msgs play-motion-builder-msgs rclcpp rclcpp-action sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ play-motion2 play-motion2-msgs play-motion-builder-msgs rclcpp rclcpp-action sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "play_motion_builder" = substituteSource {
      src = fetchgit {
        name = "play_motion_builder-source";
        url = "https://github.com/ros2-gbp/play_motion_builder-release.git";
        rev = "ed205fba359c533432905ba11c8754ce8b210890";
        hash = "sha256-k7LAav6N7yHnOj3ENuKbALQxluxs6OVE7v8JhrjxaRw=";
      };
    };
  });
  meta = {
    description = "The play_motion_builder package, a node to handle the creation of new motions for play_motion.";
  };
})
