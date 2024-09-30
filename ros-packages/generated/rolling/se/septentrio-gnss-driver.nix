{
  ament-cmake,
  buildRosPackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gps-msgs,
  mkSourceSet,
  nav-msgs,
  nmea-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
}:
let
  sources = mkSourceSet (sources: {
    "septentrio_gnss_driver" = substituteSource {
      src = fetchgit {
        name = "septentrio_gnss_driver-source";
        url = "https://github.com/ros2-gbp/septentrio_gnss_driver_ros2-release.git";
        rev = "4f592056d04bcdc124aef51dd210b22785e2180c";
        hash = "sha256-0hF2yHegysVB6UW1kJ6htFYxwG5CX3O5uEtfuVT7LYg=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "septentrio_gnss_driver";
  version = "1.4.1-1";
  src = sources."septentrio_gnss_driver";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic-msgs geometry-msgs gps-msgs nav-msgs nmea-msgs rclcpp rclcpp-components rosidl-default-runtime sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "geographiclib" "libpcap" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROSaic: C++ driver for Septentrio's GNSS and INS receivers";
  };
}
