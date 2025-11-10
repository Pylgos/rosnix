{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  crazyflie-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  motion-capture-tracking-interfaces,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf-transformations,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crazyflie";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."crazyflie";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ crazyflie-interfaces geometry-msgs motion-capture-tracking-interfaces rclcpp ros-environment sensor-msgs std-srvs tf2-ros tf-transformations ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "libusb-1.0-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ crazyflie-interfaces geometry-msgs motion-capture-tracking-interfaces rclcpp ros-environment sensor-msgs std-srvs tf2-ros tf-transformations ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libusb-1.0-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "crazyflie" = substituteSource {
      src = fetchgit {
        name = "crazyflie-source";
        url = "https://github.com/ros2-gbp/crazyswarm2-release.git";
        rev = "b6be69e410d4711613625bd29c7d4db99be4aeb7";
        hash = "sha256-1XQmwlOZM20nVQDc8QAVFJJbeQp4vdBhkYHeGM4Zd0Y=";
      };
    };
  });
  meta = {
    description = "ROS 2 Package for Bitcraze Crazyflie robots";
  };
})
