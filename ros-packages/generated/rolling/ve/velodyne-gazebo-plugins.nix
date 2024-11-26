{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velodyne_gazebo_plugins";
  version = "2.0.3-3";
  src = finalAttrs.passthru.sources."velodyne_gazebo_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gazebo_dev" "gazebo_msgs" "gazebo_ros" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "velodyne_gazebo_plugins" = substituteSource {
        src = fetchgit {
          name = "velodyne_gazebo_plugins-source";
          url = "https://github.com/ros2-gbp/velodyne_simulator-release.git";
          rev = "3eb6dc96fab18b1f0fa24edc275a0c90cf8a7a2e";
          hash = "sha256-TFxh7d/7+m5z05amlR634rbaqZYAHs06SxUx3ZlM/NI=";
        };
      };
    });
  };
  meta = {
    description = "Gazebo plugin to provide simulated data from Velodyne laser scanners.";
  };
})
