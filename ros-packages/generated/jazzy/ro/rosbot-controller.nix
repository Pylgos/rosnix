{
  ament-cmake,
  ament-cmake-pytest,
  buildAmentCmakePackage,
  controller-manager,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  imu-sensor-broadcaster,
  joint-state-broadcaster,
  launch,
  launch-ros,
  mkSourceSet,
  nav2-common,
  position-controllers,
  ros2controlcli,
  rosSystemPackages,
  rosbot-description,
  rosbot-hardware-interfaces,
  rosbot-moveit,
  rosbot-utils,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_controller";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."rosbot_controller";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager diff-drive-controller imu-sensor-broadcaster joint-state-broadcaster launch launch-ros nav2-common position-controllers ros2controlcli rosbot-description rosbot-hardware-interfaces rosbot-moveit rosbot-utils xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "husarion_mecanum_drive_controller" "udev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager diff-drive-controller imu-sensor-broadcaster joint-state-broadcaster launch launch-ros nav2-common position-controllers ros2controlcli rosbot-description rosbot-hardware-interfaces rosbot-moveit rosbot-utils xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "husarion_mecanum_drive_controller" "udev" ]; };
  checkInputs = [ ament-cmake-pytest rosbot-description xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbot_controller" = substituteSource {
      src = fetchgit {
        name = "rosbot_controller-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "ff8d38bc62331f4215bae178b212a83a70c88e4c";
        hash = "sha256-kHMqpT2w+QGAvtRrMIvPOf7dYCw0xT6VSsQ0RykVSJY=";
      };
    };
  });
  meta = {
    description = "Hardware configuration for ROSbot Series";
  };
})
