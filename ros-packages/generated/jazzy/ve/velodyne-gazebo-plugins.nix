{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velodyne_gazebo_plugins";
  version = "2.0.3-4";
  src = finalAttrs.passthru.sources."velodyne_gazebo_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-msgs rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gazebo_dev" "gazebo_ros" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "velodyne_gazebo_plugins" = substituteSource {
        src = fetchgit {
          name = "velodyne_gazebo_plugins-source";
          url = "https://github.com/ros2-gbp/velodyne_simulator-release.git";
          rev = "b222a126f184cb5576c83c2160991304727f5506";
          hash = "sha256-TFxh7d/7+m5z05amlR634rbaqZYAHs06SxUx3ZlM/NI=";
        };
      };
    });
  };
  meta = {
    description = "Gazebo plugin to provide simulated data from Velodyne laser scanners.";
  };
})
