{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "flir_camera_description";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."flir_camera_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ robot-state-publisher urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "flir_camera_description" = substituteSource {
      src = fetchgit {
        name = "flir_camera_description-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "a2c329d9a3a1aba5d6518019b1649c85c5416e4a";
        hash = "sha256-4jTRTAyBCooL0/OI7ihIsETLQoItCRO+iq1B24vv68s=";
      };
    };
  });
  meta = {
    description = "FLIR camera Description package";
  };
})
