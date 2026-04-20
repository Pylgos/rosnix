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
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2_snapshot";
  version = "0.0.6-2";
  src = finalAttrs.passthru.sources."ros2_snapshot";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2cli ros2component ros2node ros2param ros2pkg ros2service ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "graphviz" "python3-graphviz" "python3-psutil" "python3-pydantic" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli ros2component ros2node ros2param ros2pkg ros2service ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphviz" "python3-graphviz" "python3-psutil" "python3-pydantic" "python3-yaml" ]; };
  checkInputs = [ demo-nodes-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2_snapshot" = substituteSource {
      src = fetchgit {
        name = "ros2_snapshot-source";
        url = "https://github.com/ros2-gbp/ros2_snapshot-release.git";
        rev = "1f447ad6b17ca6ff7ee8f639b218d3e9042bc705";
        hash = "sha256-6RG6klUQXiBr0CjjH92zAjQcP5KV4L2eLSxoMgupr18=";
      };
    };
  });
  meta = {
    description = "ROS2 Snapshot - contains workspace modeler and snapshot tools";
  };
})
