{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  diagnostic-aggregator,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot4_diagnostics";
  version = "2.0.1-2";
  src = finalAttrs.passthru.sources."turtlebot4_diagnostics";
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-msgs diagnostic-updater irobot-create-msgs rclpy sensor-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "turtlebot4_diagnostics" = substituteSource {
        src = fetchgit {
          name = "turtlebot4_diagnostics-source";
          url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
          rev = "32bad70f6d4c90bbaf5a066a8c496dfeae1b4ad5";
          hash = "sha256-B46IK3a+5YodP4TuzKagryJAPtJbj/vHWYIAt5vb3Ko=";
        };
      };
    });
  };
  meta = {
    description = "Turtlebot4 Diagnostics";
  };
})
