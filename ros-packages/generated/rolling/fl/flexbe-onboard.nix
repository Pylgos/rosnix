{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-msgs,
  flexbe-states,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "flexbe_onboard";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."flexbe_onboard";
  propagatedNativeBuildInputs = [ flexbe-core flexbe-msgs flexbe-states launch-ros rclpy ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs flexbe-states launch-ros rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_onboard" = substituteSource {
      src = fetchgit {
        name = "flexbe_onboard-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "c7da50d27cb4e95958c27128d2cc2d8f140cc73c";
        hash = "sha256-EbO7yBYjwzsyok21wnRFK+vFSQE/2Pf3K63lSfzHNSk=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_onboard implements the robot-side of the behavior engine from where all behaviors are started.\n    ";
  };
})
