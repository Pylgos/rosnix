{
  action-msgs,
  buildAmentPythonPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  message-filters,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-msgs,
  tf2-ros-py,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "synchros2";
  version = "1.0.4-1";
  src = finalAttrs.passthru.sources."synchros2";
  propagatedNativeBuildInputs = [ action-msgs geometry-msgs launch message-filters rclpy tf2-msgs tf2-ros-py ];
  propagatedBuildInputs = [ action-msgs geometry-msgs launch message-filters rclpy tf2-msgs tf2-ros-py ];
  checkInputs = [ example-interfaces std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-typing-extensions" ]; };
  passthru.sources = mkSourceSet (sources: {
    "synchros2" = substituteSource {
      src = fetchgit {
        name = "synchros2-source";
        url = "https://github.com/bdaiinstitute/synchros2-release.git";
        rev = "0cda44bc8f7a5134cd5eaa6f44af490672062192";
        hash = "sha256-Q2kRB14G1jUlMIz2ILqDp9avfJMVZfr2xlaD+yZyYD0=";
      };
    };
  });
  meta = {
    description = "RAI Institute wrappers for ROS2";
  };
})
