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
  mecanum-drive-controller,
  mkSourceSet,
  nav2-common,
  position-controllers,
  ros2controlcli,
  rosSystemPackages,
  rosbot-description,
  rosbot-moveit,
  rosbot-utils,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_controller";
  version = "0.18.6-1";
  src = finalAttrs.passthru.sources."rosbot_controller";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager diff-drive-controller imu-sensor-broadcaster joint-state-broadcaster launch launch-ros mecanum-drive-controller nav2-common position-controllers ros2controlcli rosbot-description rosbot-moveit rosbot-utils xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "udev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager diff-drive-controller imu-sensor-broadcaster joint-state-broadcaster launch launch-ros mecanum-drive-controller nav2-common position-controllers ros2controlcli rosbot-description rosbot-moveit rosbot-utils xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "udev" ]; };
  checkInputs = [ ament-cmake-pytest rosbot-description xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbot_controller" = substituteSource {
      src = fetchgit {
        name = "rosbot_controller-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "30700c7774f0dcaabd5615153fea694d6daa8725";
        hash = "sha256-nDN2/RvFA52PRmJuXaF3PmXhL51fI+nQOwyD5UpOclw=";
      };
    };
  });
  meta = {
    description = "Hardware configuration for ROSbot Series";
  };
})
