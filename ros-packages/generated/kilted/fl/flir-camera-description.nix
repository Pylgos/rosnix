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
  version = "3.0.4-1";
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
        rev = "fad90ccbb44442040f558b61b92365353c9f3c1e";
        hash = "sha256-oWqZGvEsx7AABcmF1cpFbjU7BMQNKzaH4NKcEgki/I8=";
      };
    };
  });
  meta = {
    description = "FLIR camera Description package";
  };
})
