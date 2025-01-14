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
  version = "4.19.0-1";
  src = finalAttrs.passthru.sources."ros2_controllers_test_nodes";
  propagatedBuildInputs = [ rclpy sensor-msgs std-msgs trajectory-msgs ];
  checkInputs = [ launch-ros launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2_controllers_test_nodes" = substituteSource {
      src = fetchgit {
        name = "ros2_controllers_test_nodes-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "bd6726257dc2770aa6ab78e7e835d04eb744eb7b";
        hash = "sha256-YBU66Nq8/DtCbNTCa1J6zzoc+8hpFp0V3eVyOH34MUI=";
      };
    };
  });
  meta = {
    description = "Demo nodes for showing and testing functionalities of the ros2_control framework.";
  };
})
