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
  version = "3.0.7-1";
  src = finalAttrs.passthru.sources."flexbe_onboard";
  propagatedNativeBuildInputs = [ flexbe-core flexbe-msgs flexbe-states launch-ros rclpy ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs flexbe-states launch-ros rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_onboard" = substituteSource {
      src = fetchgit {
        name = "flexbe_onboard-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "6a0301459586bf74f27606b92e261b7e45a5f0f8";
        hash = "sha256-GVDCTTYG9LgYMhHCaG/seg252PwG9jBlvoA6PAgM+MM=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_onboard implements the robot-side of the behavior engine from where all behaviors are started.\n    ";
  };
})
