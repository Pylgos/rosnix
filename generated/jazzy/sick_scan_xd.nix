{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  diagnostic_updater,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rcl_interfaces,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    sick_scan_xd = substituteSource {
      src = fetchFromGitHub {
        name = "sick_scan_xd-source";
        owner = "ros2-gbp";
        repo = "sick_scan_xd-release";
        rev = "57b8181c28f123fc94e5d534130a66a291638dd1";
        hash = "sha256-OpGqhZHuRFU+3mBBBUkZLbQQntgFz5VerY96kBS4O7U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_scan_xd";
  version = "3.5.0-1";
  src = sources.sick_scan_xd;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater geometry_msgs nav_msgs rcl_interfaces rosidl_default_runtime sensor_msgs std_msgs tf2 tf2_ros visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS 1 and 2 driver for SICK scanner";
  };
}
