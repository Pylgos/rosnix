{
  ament-cmake,
  ament-cmake-clang-format,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  robot-state-publisher,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "flir_ptu_driver";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."flir_ptu_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-updater rclcpp robot-state-publisher sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-updater rclcpp robot-state-publisher sensor-msgs std-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "flir_ptu_driver" = substituteSource {
      src = fetchgit {
        name = "flir_ptu_driver-source";
        url = "https://github.com/ros-drivers-gbp/flir_ptu-release.git";
        rev = "9995a5f9239839e8e7ac18e7087030fa5f325d05";
        hash = "sha256-w6i0XqaxDXLbbYhIZqiuPNckftXpCy/VgmpQ4Qb+3Fk=";
      };
    };
  });
  meta = {
    description = "ROS 2 driver for FLIR pan-tilt units with serial and TCP/Ethernet support.";
  };
})
