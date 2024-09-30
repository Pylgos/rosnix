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
  nmea-msgs,
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
    "mrpt_sensor_gnss_nmea" = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_gnss_nmea-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "bad2e14e8055bcc1b24cf7af43d984f5e2b75d19";
        hash = "sha256-AZcZeGwHOjz/3QOqQ7+B9U1A1MQLQZJfbvs+EwbBJWw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mrpt_sensor_gnss_nmea";
  version = "0.2.3-1";
  src = sources."mrpt_sensor_gnss_nmea";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-lint-auto ament-lint-common ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge geometry-msgs mrpt-libhwdrivers mrpt-libros-bridge mrpt-msgs mrpt-sensorlib nav-msgs nmea-msgs rclcpp rclcpp-components sensor-msgs std-msgs stereo-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS node for GNSS receivers generating NMEA messages (based on mrpt-hwdrivers)";
  };
}
