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
  version = "1.4.0-1";
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
        rev = "d235a4427da622bc769f53a7c49ded68f54951c9";
        hash = "sha256-UBB9RjEZ36ZXRpj1SHyOqXO6lNyKH9PfMOCeyaAVad8=";
      };
    };
  });
  meta = {
    description = "The play_motion_builder package, a node to handle the creation of new motions for play_motion.";
  };
})
