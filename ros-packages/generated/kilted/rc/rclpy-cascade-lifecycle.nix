{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  cascade-lifecycle-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rclpy_cascade_lifecycle";
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."rclpy_cascade_lifecycle";
  propagatedNativeBuildInputs = [ cascade-lifecycle-msgs lifecycle-msgs rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ cascade-lifecycle-msgs lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rclpy_cascade_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rclpy_cascade_lifecycle-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "a8020a1e8536fdedfc04a6290a829faf5f7f622d";
        hash = "sha256-g2T3Fr0XgoFOCz28fL/y0Int6y3DkRR/PP9CUSXqRxY=";
      };
    };
  });
  meta = {
    description = "Provides a mechanism to make trees of lifecycle nodes to propagate state changes in python";
  };
})
