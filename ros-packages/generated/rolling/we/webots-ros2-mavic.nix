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
  version = "2025.0.1-1";
  src = finalAttrs.passthru.sources."webots_ros2_mavic";
  propagatedNativeBuildInputs = [ builtin-interfaces rclpy webots-ros2-driver ];
  propagatedBuildInputs = [ builtin-interfaces rclpy webots-ros2-driver ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_mavic" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_mavic-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "08003177cda78e9581e56e0e3a5ce2fd9041439b";
        hash = "sha256-praWCB1Kr270z/2+NnjGJwWbxm5xGHr0rMraf/qQ6aE=";
      };
    };
  });
  meta = {
    description = "Mavic 2 Pro robot ROS2 interface for Webots.";
  };
})
