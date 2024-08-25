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
  libpcap,
  nav_msgs,
  novatel_gps_msgs,
  python3Packages,
  rclcpp,
  rclcpp_components,
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
    novatel_gps_driver = substituteSource {
      src = fetchgit {
        name = "novatel_gps_driver-source";
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
  src = sources.novatel_gps_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater gps_msgs libpcap nav_msgs novatel_gps_msgs python3Packages.boost rclcpp rclcpp_components sensor_msgs std_msgs swri_math_util swri_roscpp swri_serial_util tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_index_cpp ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Driver for NovAtel receivers";
  };
}
