{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-graceful-controller,
  nav2-msgs,
  nav2-util,
  opennav-docking-core,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
  yaml-cpp-vendor,
}:
let
  sources = mkSourceSet (sources: {
    "opennav_docking" = substituteSource {
      src = fetchgit {
        name = "opennav_docking-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "06c983c12bf21fa2ecf378ea2c66d3a7c7146e4b";
        hash = "sha256-oYMQqBvVgM5FLPZFrKDxNjYTFDJdTanndgsarscpmRQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "opennav_docking";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."opennav_docking";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles builtin-interfaces geometry-msgs nav2-graceful-controller nav2-msgs nav2-util nav-msgs opennav-docking-core pluginlib rclcpp rclcpp-action rclcpp-lifecycle sensor-msgs tf2-ros yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "A Task Server for robot charger docking";
  };
})
