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
  version = "4.40.0-1";
  src = finalAttrs.passthru.sources."ros2_controllers_test_nodes";
  propagatedNativeBuildInputs = [ rclpy sensor-msgs std-msgs trajectory-msgs ];
  propagatedBuildInputs = [ rclpy sensor-msgs std-msgs trajectory-msgs ];
  checkInputs = [ launch-ros launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2_controllers_test_nodes" = substituteSource {
      src = fetchgit {
        name = "ros2_controllers_test_nodes-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "ac237dbfdc67bf6b2f6e98b60234ddb3a5229b4d";
        hash = "sha256-3foLItcTiE/azzxlwX8ujaUFMzMlIRzgQ2SpGDXIRKM=";
      };
    };
  });
  meta = {
    description = "Demo nodes for showing and testing functionalities of the ros2_control framework.";
  };
})
