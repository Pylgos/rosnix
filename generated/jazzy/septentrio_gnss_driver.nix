{
  ament_cmake,
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gps_msgs,
  nav_msgs,
  nmea_msgs,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    septentrio_gnss_driver = substituteSource {
      src = fetchgit {
        name = "septentrio_gnss_driver-source";
        url = "https://github.com/ros2-gbp/septentrio_gnss_driver_ros2-release.git";
        rev = "eb96ef59eedf47dc809ec590f844586bfdf67b21";
        hash = "sha256-0hF2yHegysVB6UW1kJ6htFYxwG5CX3O5uEtfuVT7LYg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "septentrio_gnss_driver";
  version = "1.4.1-1";
  src = sources.septentrio_gnss_driver;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_msgs geometry_msgs gps_msgs nav_msgs nmea_msgs rclcpp rclcpp_components rosidl_default_runtime sensor_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "geographiclib" "libpcap" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROSaic: C++ driver for Septentrio's GNSS and INS receivers";
  };
}
