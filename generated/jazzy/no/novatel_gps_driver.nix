{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  buildRosPackage,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  gps_msgs,
  nav_msgs,
  novatel_gps_msgs,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
  swri_math_util,
  swri_roscpp,
  swri_serial_util,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    novatel_gps_driver-7580e71bbf15956d6866097fe57b8760dd838974 = substituteSource {
      src = fetchgit {
        name = "novatel_gps_driver-7580e71bbf15956d6866097fe57b8760dd838974-source";
        url = "https://github.com/ros2-gbp/novatel_gps_driver-release.git";
        rev = "7580e71bbf15956d6866097fe57b8760dd838974";
        hash = "sha256-ySTUo1pz5bUi9Fxugmpv6utH9hUGIyQlng4HHGc08C0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "novatel_gps_driver";
  version = "4.1.2-5";
  src = sources.novatel_gps_driver-7580e71bbf15956d6866097fe57b8760dd838974;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater gps_msgs nav_msgs novatel_gps_msgs rclcpp rclcpp_components sensor_msgs std_msgs swri_math_util swri_roscpp swri_serial_util tf2 tf2_geometry_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libpcap" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_index_cpp ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver for NovAtel receivers";
  };
}
