{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  plotjuggler,
  plotjuggler-msgs,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  rosbag2-transport,
  substituteSource,
  tf2-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plotjuggler_ros";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."plotjuggler_ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ plotjuggler plotjuggler-msgs rclcpp rcpputils rosbag2-transport tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "binutils" "boost" "fmt" "libqt5-svg-dev" "libqt5-websockets-dev" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plotjuggler plotjuggler-msgs rclcpp rcpputils rosbag2-transport tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "binutils" "boost" "fmt" "libqt5-svg-dev" "libqt5-websockets-dev" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "plotjuggler_ros" = substituteSource {
      src = fetchgit {
        name = "plotjuggler_ros-source";
        url = "https://github.com/ros2-gbp/plotjuggler-ros-plugins-release.git";
        rev = "ce7ccc4916bcec6318ceee48d01e954bbbfa1bc3";
        hash = "sha256-T774nUiAiMmNPODGnqD7ruf/RR8GoAKI2YFm1lqoPfk=";
      };
    };
  });
  meta = {
    description = "PlotJuggler plugin for ROS";
  };
})
