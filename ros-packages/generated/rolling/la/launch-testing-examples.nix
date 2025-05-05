{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
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
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."launch_testing_examples";
  propagatedNativeBuildInputs = [ demo-nodes-cpp launch launch-ros launch-testing launch-testing-ros rcl-interfaces rclpy ros2bag std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ demo-nodes-cpp launch launch-ros launch-testing launch-testing-ros rcl-interfaces rclpy ros2bag std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing_examples" = substituteSource {
      src = fetchgit {
        name = "launch_testing_examples-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "4ff1a489972cfbcd046c2045a9b8484ba12b6f38";
        hash = "sha256-gN3/jE2iX8DYGkM96+gLl6aT/2taoTBB+hy3MdqLS60=";
      };
    };
  });
  meta = {
    description = "Examples of simple launch tests";
  };
})
