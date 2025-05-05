{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps-msgs,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  nav-msgs,
  nmea-msgs,
  novatel-oem7-msgs,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rclpy,
  rosSystemPackages,
  rosbag2,
  rosidl-runtime-py,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "novatel_oem7_driver";
  version = "24.1.0-1";
  src = finalAttrs.passthru.sources."novatel_oem7_driver";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ gps-msgs nav-msgs nmea-msgs novatel-oem7-msgs pluginlib rclcpp rclcpp-components sensor-msgs tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "geographiclib" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ gps-msgs nav-msgs nmea-msgs novatel-oem7-msgs pluginlib rclcpp rclcpp-components sensor-msgs tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "geographiclib" ]; };
  checkInputs = [ launch-testing launch-testing-ament-cmake launch-testing-ros rclpy rosbag2 rosidl-runtime-py ];
  passthru.sources = mkSourceSet (sources: {
    "novatel_oem7_driver" = substituteSource {
      src = fetchgit {
        name = "novatel_oem7_driver-source";
        url = "https://github.com/novatel-gbp/novatel_oem7_driver-release.git";
        rev = "20aff52b8d2e58e37116965e2c8f49d7a8f58819";
        hash = "sha256-Px9Amgu3N9WQph9LyYHognGo/bpsPUdlmeWLDarz7Fg=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/novatel/novatel_edie";
          to = "URL ${sources."novatel_oem7_driver/novatel_edie"}";
        }
      ];
    };
    "novatel_oem7_driver/novatel_edie" = substituteSource {
      src = fetchgit {
        name = "novatel_edie-source";
        url = "https://github.com/novatel/novatel_edie";
        rev = "690d2a88e5eb8e0ad4a04e5ae0706e8b67fdb947";
        hash = "sha256-w2huRuu81NQOvjuuGP+6OF1lwxMydsWLQCsyJIDsR00=";
      };
    };
  });
  meta = {
    description = "NovAtel Oem7 ROS Driver";
  };
})
