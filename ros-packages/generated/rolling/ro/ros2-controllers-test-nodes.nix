{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  launch-testing-ros,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2_controllers_test_nodes";
  version = "4.20.0-1";
  src = finalAttrs.passthru.sources."ros2_controllers_test_nodes";
  propagatedBuildInputs = [ rclpy sensor-msgs std-msgs trajectory-msgs ];
  checkInputs = [ launch-ros launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2_controllers_test_nodes" = substituteSource {
      src = fetchgit {
        name = "ros2_controllers_test_nodes-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "fe0ad0bdfc2cb55e6eec7f480622b2b9ca8921d7";
        hash = "sha256-kdc5MJ+kqhhsjgFFaW3xHt9n3TLRsWpw86cBGF+B2HA=";
      };
    };
  });
  meta = {
    description = "Demo nodes for showing and testing functionalities of the ros2_control framework.";
  };
})
