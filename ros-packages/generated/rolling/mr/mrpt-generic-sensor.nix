{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-msgs,
  mrpt-sensorlib,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_generic_sensor";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."mrpt_generic_sensor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-lint-auto ament-lint-common rclcpp ros-environment ];
  propagatedBuildInputs = [ mrpt-msgs mrpt-sensorlib rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_generic_sensor" = substituteSource {
      src = fetchgit {
        name = "mrpt_generic_sensor-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "9c49dbacd270358d92865b9ae645a838ebd319f8";
        hash = "sha256-zy7AqmAH8M/rMumF0LopeoC7jzQOPo5Y436ngxwaoxk=";
      };
    };
  });
  meta = {
    description = "ROS node for interfacing any sensor supported by mrpt-hwdrivers";
  };
})
