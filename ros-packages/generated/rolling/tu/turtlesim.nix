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
  version = "1.9.2-1";
  src = finalAttrs.passthru.sources."turtlesim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rclcpp-action std-msgs std-srvs turtlesim-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "qt5-qmake" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlesim" = substituteSource {
      src = fetchgit {
        name = "turtlesim-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "4fa7d0da6427665fa4540503b0c5bc5cf85314db";
        hash = "sha256-ubEzRIkm0yl5MNSHbJDbWkgXp05T9JMpO2ogZNP4zd8=";
      };
    };
  });
  meta = {
    description = "turtlesim is a tool made for teaching ROS and ROS packages.";
  };
})
