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
  version = "0.21.1-1";
  src = finalAttrs.passthru.sources."launch_testing_examples";
  propagatedNativeBuildInputs = [ demo-nodes-cpp launch launch-ros launch-testing launch-testing-ros rcl-interfaces rclpy ros2bag std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ demo-nodes-cpp launch launch-ros launch-testing launch-testing-ros rcl-interfaces rclpy ros2bag std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing_examples" = substituteSource {
      src = fetchgit {
        name = "launch_testing_examples-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "179a077627b7f4b1698172c5db50cf48f246be9b";
        hash = "sha256-Pkyv4sTK9Jxxx9/FwMWjVDZhFhuqb4Pxhbk8kfh/fF0=";
      };
    };
  });
  meta = {
    description = "Examples of simple launch tests";
  };
})
