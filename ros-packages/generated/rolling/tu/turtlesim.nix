{
  ament-cmake,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  turtlesim-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlesim";
  version = "1.11.0-1";
  src = finalAttrs.passthru.sources."turtlesim";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp geometry-msgs rclcpp rclcpp-action std-msgs std-srvs turtlesim-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqtcore" "libqtgui" "qt-base-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp geometry-msgs rclcpp rclcpp-action std-msgs std-srvs turtlesim-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqtcore" "libqtgui" "qt-base-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlesim" = substituteSource {
      src = fetchgit {
        name = "turtlesim-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "a096e513f5031d7045368760cef4683981b26856";
        hash = "sha256-QmBz21dvexfCgURmJfZUO0aAHn3UdfQPjI8gBmZ/MOo=";
      };
    };
  });
  meta = {
    description = "\n    turtlesim is a tool made for teaching ROS and ROS packages.\n  ";
  };
})
