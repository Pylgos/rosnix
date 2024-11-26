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
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."launch_testing_examples";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ demo-nodes-cpp launch launch-ros launch-testing launch-testing-ros rcl-interfaces rclpy ros2bag std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ];
  passthru = {
    sources = mkSourceSet (sources: {
      "launch_testing_examples" = substituteSource {
        src = fetchgit {
          name = "launch_testing_examples-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "a4649ffc9b6be0907997108fee1cf9a0e708e91b";
          hash = "sha256-vC/jeRPHLMaIzkCHZoilSL0Rtp2+wkqUkSrqXj9zH3Y=";
        };
      };
    });
  };
  meta = {
    description = "Examples of simple launch tests";
  };
})
