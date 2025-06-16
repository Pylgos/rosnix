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
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."open_manipulator_collision";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ kdl-parser rclcpp sensor-msgs std-msgs urdf visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libfcl" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ kdl-parser rclcpp sensor-msgs std-msgs urdf visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libfcl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_collision" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_collision-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "4ca3e959335f7e1bcff506b8a57a194e978ebe04";
        hash = "sha256-6oJ3pcGSvi7rt4S/fcaoovm2KCHeGNHC4KuRyossUWk=";
      };
    };
  });
  meta = {
    description = "\n    This package implements a self-collision detection system for the follower robot during\n    follow-the-leader teleoperation. Its primary purpose is to enhance safety by detecting\n    potential self-collisions in real time while the robot is being remotely operated.  ";
  };
})
