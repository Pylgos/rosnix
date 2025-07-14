{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  kdl-parser,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  urdf,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_collision";
  version = "4.0.5-1";
  src = finalAttrs.passthru.sources."open_manipulator_collision";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ kdl-parser rclcpp sensor-msgs std-msgs urdf visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libfcl-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ kdl-parser rclcpp sensor-msgs std-msgs urdf visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libfcl-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_collision" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_collision-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "f54a8832d137f8a476a9d5a25145bca281c239f3";
        hash = "sha256-VV4IWa0uuQY1ag92MlOChJdMPaIKs7MQR9WZ5bj3dsA=";
      };
    };
  });
  meta = {
    description = "\n    This package implements a self-collision detection system for the follower robot during\n    leader-follower teleoperation. Its primary purpose is to enhance safety by detecting\n    potential self-collisions in real time while the robot is being remotely operated.  ";
  };
})
