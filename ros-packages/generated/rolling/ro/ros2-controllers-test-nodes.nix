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
  version = "4.22.0-1";
  src = finalAttrs.passthru.sources."ros2_controllers_test_nodes";
  propagatedBuildInputs = [ rclpy sensor-msgs std-msgs trajectory-msgs ];
  checkInputs = [ launch-ros launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2_controllers_test_nodes" = substituteSource {
      src = fetchgit {
        name = "ros2_controllers_test_nodes-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "45d113472928b7faf922f5cd9a2adc997285772b";
        hash = "sha256-r/AO/jcFBMLJPAn2dnjw0l6Qf61qKIAUPoQfaYQCtaY=";
      };
    };
  });
  meta = {
    description = "Demo nodes for showing and testing functionalities of the ros2_control framework.";
  };
})
