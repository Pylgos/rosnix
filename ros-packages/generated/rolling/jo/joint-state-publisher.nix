{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rclpy,
  ros2topic,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "joint_state_publisher";
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."joint_state_publisher";
  propagatedNativeBuildInputs = [ rclpy sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-packaging" ]; };
  propagatedBuildInputs = [ rclpy sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-packaging" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch-testing launch-testing-ros ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "joint_state_publisher" = substituteSource {
      src = fetchgit {
        name = "joint_state_publisher-source";
        url = "https://github.com/ros2-gbp/joint_state_publisher-release.git";
        rev = "65ad681c67154ba348e6229ed3b208a2a717271c";
        hash = "sha256-MECmuBQRqeyewXoG7F9C8YqVVzaJN0Q7GJc6nOh9wvE=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a tool for setting and publishing joint state values for a given URDF.\n  ";
  };
})
