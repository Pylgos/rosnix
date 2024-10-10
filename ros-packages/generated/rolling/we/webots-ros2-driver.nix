{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  python-cmake-module,
  rclcpp,
  rclpy,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  tinyxml2-vendor,
  vision-msgs,
  webots-ros2-importer,
  webots-ros2-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "webots_ros2_driver" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_driver-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "f25a8ae6bdde248411467d08b251b25bec2f8a88";
        hash = "sha256-G6weVTbEsygOn7dKbZRH3n+HRo2Yz1i2JeACgKMjWwk=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "webots_ros2_driver";
  version = "2023.1.3-1";
  src = finalAttrs.passthru.sources."webots_ros2_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-python python-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs pluginlib rclcpp rclpy sensor-msgs std-msgs tf2-geometry-msgs tf2-ros tinyxml2-vendor vision-msgs webots-ros2-importer webots-ros2-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Implementation of the Webots - ROS 2 interface";
  };
})
