{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  mrpt-libhwdrivers,
  mrpt-libros-bridge,
  mrpt-msgs,
  mrpt-sensorlib,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_sensor_bumblebee_stereo";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."mrpt_sensor_bumblebee_stereo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-lint-auto ament-lint-common ros-environment ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs mrpt-libhwdrivers mrpt-libros-bridge mrpt-msgs mrpt-sensorlib nav-msgs rclcpp rclcpp-components sensor-msgs std-msgs stereo-msgs tf2 tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_sensor_bumblebee_stereo" = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_bumblebee_stereo-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "a3ff6a91d54ab63f950a534275ec9696d6abd1c0";
        hash = "sha256-RdSetxlV3aRkTreC+ol1ENdwAu440EnXqTubJg53Q48=";
      };
    };
  });
  meta = {
    description = "ROS node for Bumblebee Stereo Cameras using libdc1394 interface (based on mrpt-hwdrivers)";
  };
})
