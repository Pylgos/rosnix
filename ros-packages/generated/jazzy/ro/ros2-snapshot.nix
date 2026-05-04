{
  ament-index-python,
  buildAmentPythonPackage,
  demo-nodes-py,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  ros2cli,
  ros2component,
  ros2node,
  ros2param,
  ros2pkg,
  ros2service,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2_snapshot";
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."ros2_snapshot";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2cli ros2component ros2node ros2param ros2pkg ros2service std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "graphviz" "python3-graphviz" "python3-psutil" "python3-pydantic" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli ros2component ros2node ros2param ros2pkg ros2service std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphviz" "python3-graphviz" "python3-psutil" "python3-pydantic" "python3-yaml" ]; };
  checkInputs = [ demo-nodes-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2_snapshot" = substituteSource {
      src = fetchgit {
        name = "ros2_snapshot-source";
        url = "https://github.com/ros2-gbp/ros2_snapshot-release.git";
        rev = "4a147079745085d207fb0aadf9b1ece82f085a12";
        hash = "sha256-wDrXX3bR8qyGS059v9I6zubZAWHx1RWixdpNjT0R+Z8=";
      };
    };
  });
  meta = {
    description = "ROS2 Snapshot - contains workspace modeler and snapshot tools";
  };
})
