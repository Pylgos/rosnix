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
  flexbe-testing,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "flexbe_states";
  version = "4.0.2-1";
  src = finalAttrs.passthru.sources."flexbe_states";
  propagatedNativeBuildInputs = [ flexbe-core flexbe-msgs flexbe-testing rclpy ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs flexbe-testing rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_states" = substituteSource {
      src = fetchgit {
        name = "flexbe_states-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "4ae7e870ab828d7f40df6770d3fe18860f9a0c87";
        hash = "sha256-kbd+AJhW4xjdatVwv++F2ls1cSXSEV4k1Kl5NSSfHmw=";
      };
    };
  });
  meta = {
    description = "\n      flexbe_states provides a collection of common generic predefined states.\n    ";
  };
})
