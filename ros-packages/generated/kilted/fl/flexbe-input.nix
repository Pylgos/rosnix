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
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "flexbe_input";
  version = "4.0.2-1";
  src = finalAttrs.passthru.sources."flexbe_input";
  propagatedNativeBuildInputs = [ flexbe-core flexbe-msgs rclpy ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_input" = substituteSource {
      src = fetchgit {
        name = "flexbe_input-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "4117eccd6acc0f08af6d77fb9f86d1b9d2303d4a";
        hash = "sha256-fvj+LIuWCLMpsT3rkY9vHHTUxzF3teUHg17Y03lLXbA=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_input enables to send data to onboard behavior when required.\n    ";
  };
})
