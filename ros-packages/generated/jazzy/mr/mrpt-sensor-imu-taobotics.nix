{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "mrpt_sensor_imu_taobotics" = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_imu_taobotics-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "b503c4a001f57759bf900f5a9ff6c3f190dbbb38";
        hash = "sha256-i/VI6NybgOTVnmZO3RoHSnA7Gbjea8iGtqnuJ2+MjmQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mrpt_sensor_imu_taobotics";
  version = "0.2.3-1";
  src = sources."mrpt_sensor_imu_taobotics";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-lint-auto ament-lint-common ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge geometry-msgs mrpt-libhwdrivers mrpt-libros-bridge mrpt-msgs mrpt-sensorlib nav-msgs rclcpp rclcpp-components sensor-msgs std-msgs stereo-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS node for Taobotics USB IMUs (based on mrpt-hwdrivers)";
  };
}
