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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlesim";
  version = "1.10.1-1";
  src = finalAttrs.passthru.sources."turtlesim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp geometry-msgs rclcpp rclcpp-action std-msgs std-srvs turtlesim-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "qt5-qmake" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp geometry-msgs rclcpp rclcpp-action std-msgs std-srvs turtlesim-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "qt5-qmake" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlesim" = substituteSource {
      src = fetchgit {
        name = "turtlesim-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "7bd2f5600dc711458d77a47a159df161c83f3c77";
        hash = "sha256-MfEr15b4YcPsIfZES2awsTnpoVYPn6P8Us+r5J+/9tw=";
      };
    };
  });
  meta = {
    description = "\n    turtlesim is a tool made for teaching ROS and ROS packages.\n  ";
  };
})
