{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  mrpt-libhwdrivers,
  mrpt-libros-bridge,
  mrpt-msgs,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
let
  sources = mkSourceSet (sources: {
    "mrpt_sensorlib" = substituteSource {
      src = fetchgit {
        name = "mrpt_sensorlib-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "795f7a35d73a4c86406cc5fc2cb95788d38e598a";
        hash = "sha256-kt+3P2zL6jNk5caCQSREXZ0hVcHkV2dmaXd2sP0fDcA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mrpt_sensorlib";
  version = "0.2.3-1";
  src = sources."mrpt_sensorlib";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-lint-auto ament-lint-common ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge geometry-msgs mrpt-libhwdrivers mrpt-libros-bridge mrpt-msgs nav-msgs rclcpp rclcpp-components sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ library for the base generic MRPT sensor node";
  };
}
