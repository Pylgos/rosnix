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
  version = "1.0.2-1";
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
        rev = "0213fbb07fa5b05df655add9d4212a42ede92dfd";
        hash = "sha256-YQPughDQ2iQVZe4inN47boShPIEy9sn0WI+TOP4QxsU=";
      };
    };
  });
  meta = {
    description = "ROS 2 driver for FLIR pan-tilt units with serial and TCP/Ethernet support.";
  };
})
