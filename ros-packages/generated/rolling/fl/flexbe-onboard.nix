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
  version = "4.0.3-1";
  src = finalAttrs.passthru.sources."flexbe_onboard";
  propagatedNativeBuildInputs = [ flexbe-core flexbe-msgs flexbe-states launch-ros rclpy ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs flexbe-states launch-ros rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_onboard" = substituteSource {
      src = fetchgit {
        name = "flexbe_onboard-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "b8e11e2f3dd28230a1d555e61b223d481d96c0f3";
        hash = "sha256-o0TWI6PmC38fj6HzNsquUJ5gI1zD5110VRZ8vWzb0EM=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_onboard implements the robot-side of the behavior engine from where all behaviors are started.\n    ";
  };
})
