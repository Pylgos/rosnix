{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ouxt-lint-common,
  rclcpp,
  rosSystemPackages,
  rviz2,
  std-msgs,
  substituteSource,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "color_names";
  version = "0.0.3-6";
  src = finalAttrs.passthru.sources."color_names";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp rviz2 std-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rviz2 std-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ouxt-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "color_names" = substituteSource {
      src = fetchgit {
        name = "color_names-source";
        url = "https://github.com/ros2-gbp/color_names-release.git";
        rev = "e0678b4bf68ce7ce8cf1ec15ada29300e365ca06";
        hash = "sha256-956LQvQPv4QtQBKeDL62YimdLDh1yLGsi9AYgWiBh/k=";
      };
    };
  });
  meta = {
    description = "The color_names package";
  };
})
