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
  rcl-interfaces,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  std-srvs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlesim";
  version = "1.8.3-1";
  src = finalAttrs.passthru.sources."turtlesim";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp geometry-msgs rcl-interfaces rclcpp rclcpp-action rosidl-default-runtime std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "qt5-qmake" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlesim" = substituteSource {
      src = fetchgit {
        name = "turtlesim-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "dee596e8c4643aec9e5a6f93098371f93b5c8a02";
        hash = "sha256-+NwG+0EX/wiy8jFqWI7LoLitojrfxvVmRfY4duvQICU=";
      };
    };
  });
  meta = {
    description = "turtlesim is a tool made for teaching ROS and ROS packages.";
  };
})
