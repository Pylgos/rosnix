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
  version = "5.7.0-1";
  src = finalAttrs.passthru.sources."ros2_controllers_test_nodes";
  propagatedNativeBuildInputs = [ rclpy sensor-msgs std-msgs trajectory-msgs ];
  propagatedBuildInputs = [ rclpy sensor-msgs std-msgs trajectory-msgs ];
  checkInputs = [ launch-ros launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2_controllers_test_nodes" = substituteSource {
      src = fetchgit {
        name = "ros2_controllers_test_nodes-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "993b856eb01a31e6c23dd1c62bf0f9ddc282ad5a";
        hash = "sha256-345hjF1wbdBAeHmrMJ5hUZ4rTT9IA1mR255dp7mPJ+w=";
      };
    };
  });
  meta = {
    description = "Demo nodes for showing and testing functionalities of the ros2_control framework.";
  };
})
