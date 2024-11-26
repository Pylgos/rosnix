{
  ament-cmake,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  mkSourceSet,
  ros2-controllers,
  ros2launch,
  rosSystemPackages,
  rsl,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_control";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."irobot_create_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-broadcaster ros2-controllers ros2launch rsl ];
  checkInputs = [ ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_control" = substituteSource {
      src = fetchgit {
        name = "irobot_create_control-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "d28a594294502afeabcb18897efa1fa7a7657093";
        hash = "sha256-onK0Y4CHHFOcoGq525bOy2/hJXwyPkfCCL7MOHjy+Oo=";
      };
    };
  });
  meta = {
    description = "Provides the diff-drive controller for the iRobot(R) Create(R) 3 Educational Robot.";
  };
})
