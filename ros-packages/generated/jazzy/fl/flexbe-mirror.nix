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
  pname = "flexbe_mirror";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."flexbe_mirror";
  propagatedBuildInputs = [ flexbe-core flexbe-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "flexbe_mirror" = substituteSource {
        src = fetchgit {
          name = "flexbe_mirror-source";
          url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
          rev = "2d45bf836c525403e10f6fc2caedd98e0da9a926";
          hash = "sha256-SSn47+ekb/7OgTTqqklfqRhzbO2J+7heIZotvzRPa9c=";
        };
      };
    });
  };
  meta = {
    description = "flexbe_mirror implements functionality to remotely mirror an executed behavior.";
  };
})
