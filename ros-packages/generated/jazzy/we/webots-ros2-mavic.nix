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
  version = "2025.0.0-1";
  src = finalAttrs.passthru.sources."webots_ros2_mavic";
  propagatedBuildInputs = [ builtin-interfaces rclpy webots-ros2-driver ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_mavic" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_mavic-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "801b86f791f20871aa89b750c01f2dfabb431af0";
        hash = "sha256-AaZBBoLYLzssY82cr0xMLRiMcfcrE/fZovGDOF8h1jM=";
      };
    };
  });
  meta = {
    description = "Mavic 2 Pro robot ROS2 interface for Webots.";
  };
})
