{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  mkSourceSet,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  turtlebot4-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot4_tests";
  version = "2.0.1-2";
  src = finalAttrs.passthru.sources."turtlebot4_tests";
  propagatedNativeBuildInputs = [ irobot-create-msgs sensor-msgs std-msgs turtlebot4-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-psutil" ]; };
  propagatedBuildInputs = [ irobot-create-msgs sensor-msgs std-msgs turtlebot4-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-psutil" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_tests" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_tests-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "9c1a5dfe56e3272bbc44999eb2e9595ca2c081a7";
        hash = "sha256-/CP7sSSE9zZ+68S0RoDpbJW8IHLCO5SYt7YiTromo5M=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 System Tests";
  };
})
