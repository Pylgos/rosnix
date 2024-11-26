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
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."flexbe_input";
  propagatedBuildInputs = [ flexbe-core flexbe-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_input" = substituteSource {
      src = fetchgit {
        name = "flexbe_input-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "15e469e007b5664e9321f2a291e2a952409147b5";
        hash = "sha256-zcBWjs46lO3Mn9pE3mtDK1mqO1tF+F2iToPqTvFECY4=";
      };
    };
  });
  meta = {
    description = "flexbe_input enables to send data to onboard behavior when required.";
  };
})
