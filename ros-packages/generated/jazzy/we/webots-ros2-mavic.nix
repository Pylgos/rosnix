{
  ament-copyright,
  buildAmentPythonPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  webots-ros2-driver,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_mavic";
  version = "2023.1.3-1";
  src = finalAttrs.passthru.sources."webots_ros2_mavic";
  propagatedBuildInputs = [ builtin-interfaces rclpy webots-ros2-driver ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_mavic" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_mavic-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "4a53c806416c2dd8001e9c06550455c6a350256f";
        hash = "sha256-fFjl+kzo8dFp4pJE8dNCeIPEPsjKsD/fBvf49R8oMzQ=";
      };
    };
  });
  meta = {
    description = "Mavic 2 Pro robot ROS2 interface for Webots.";
  };
})
