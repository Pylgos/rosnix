{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  plotjuggler,
  rclcpp,
  rcpputils,
  ros-environment,
  rosSystemPackages,
  rosbag2,
  rosbag2-transport,
  substituteSource,
  tf2-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plotjuggler_ros";
  version = "2.1.3-1";
  src = finalAttrs.passthru.sources."plotjuggler_ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ plotjuggler rclcpp rcpputils rosbag2 rosbag2-transport tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "binutils" "boost" "libqt5-svg-dev" "libqt5-websockets-dev" "qtbase5-dev" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "plotjuggler_ros" = substituteSource {
        src = fetchgit {
          name = "plotjuggler_ros-source";
          url = "https://github.com/ros2-gbp/plotjuggler-ros-plugins-release.git";
          rev = "3498b0cebc478d3431d3382ac7e75dd3ded8b115";
          hash = "sha256-+d7GpqXlKqeQdqb5IGZB2Krc/uFEN9rqGmqn2o/2Bd4=";
        };
      };
    });
  };
  meta = {
    description = "PlotJuggler plugin for ROS";
  };
})
