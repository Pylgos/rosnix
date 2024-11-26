{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  demo-nodes-cpp,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  ros2bag,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_testing_examples";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."launch_testing_examples";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ demo-nodes-cpp launch launch-ros launch-testing launch-testing-ros rcl-interfaces rclpy ros2bag std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing_examples" = substituteSource {
      src = fetchgit {
        name = "launch_testing_examples-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "c2236ee11ef8f07bccd6904e0db1d6579fd030d4";
        hash = "sha256-AnGtfmc/Fo5R0zEcot5yB6C+xgFOA31yvAnV9fQRBK0=";
      };
    };
  });
  meta = {
    description = "Examples of simple launch tests";
  };
})
