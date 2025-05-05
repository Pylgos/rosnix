{
  ament-cmake,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "neo_simulation2";
  version = "1.0.0-5";
  src = finalAttrs.passthru.sources."neo_simulation2";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "neo_simulation2" = substituteSource {
      src = fetchgit {
        name = "neo_simulation2-source";
        url = "https://github.com/ros2-gbp/neo_simulation2-release.git";
        rev = "c13b97f6ffbb4750704ec1811473e7b2a6489e57";
        hash = "sha256-RDPwVwW9QTfOVM8jYVgKbR+YmGDSXRq1Wz5minbCbD8=";
      };
    };
  });
  meta = {
    description = "ROS-2 Simulation packages for neobotix robots";
  };
})
