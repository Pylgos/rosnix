{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_uncrustify,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
  ublox_ubx_interfaces,
  ublox_ubx_msgs,
}:
let
  sources = rec {
    ublox_nav_sat_fix_hp_node = substituteSource {
      src = fetchgit {
        name = "ublox_nav_sat_fix_hp_node-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "6e4e6fa37b6afe04c3cbefd85b6f28cd566a01f7";
        hash = "sha256-tSiEDFsNto+4KxHDINiu/T57IUkWnrtle7tkbT+B+c0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_nav_sat_fix_hp_node";
  version = "0.5.3-1";
  src = sources.ublox_nav_sat_fix_hp_node;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components sensor_msgs std_msgs ublox_ubx_interfaces ublox_ubx_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_cppcheck ament_cmake_uncrustify ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides a NavSatFix node for a u-blox GPS GNSS receiver using Gen 9 UBX Protocol";
  };
}
