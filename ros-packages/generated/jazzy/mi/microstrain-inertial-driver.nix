{
  ament-cmake-gtest,
  ament-cpplint,
  buildRosPackage,
  diagnostic-aggregator,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  microstrain-inertial-msgs,
  mkSourceSet,
  nav-msgs,
  nmea-msgs,
  rclcpp-lifecycle,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  rtcm-msgs,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
let
  sources = mkSourceSet (sources: {
    "microstrain_inertial_driver" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_driver-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "2a8e8a4f6c2870f11e6c826e72a19efc0c0f0b30";
        hash = "sha256-X29UZFDfi/zZxdj6lxfQRxhsXTZv1yBdjg0x98wbD/Y=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "microstrain_inertial_driver";
  version = "4.3.0-1";
  src = sources."microstrain_inertial_driver";
  nativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-updater geometry-msgs lifecycle-msgs microstrain-inertial-msgs nav-msgs nmea-msgs rclcpp-lifecycle rosidl-default-runtime rtcm-msgs sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" "jq" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-cpplint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ros_mscl package provides a driver for the LORD/Microstrain inertial products.";
  };
}
