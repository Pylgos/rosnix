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
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."flir_camera_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "flir_camera_description" = substituteSource {
      src = fetchgit {
        name = "flir_camera_description-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "818c5320a087c135c8f1d201e2d7c68e22eaf84c";
        hash = "sha256-RHtOxmtXFjTcvD6C62N9fv7nCOdffXBB0Ah586A7GdA=";
      };
    };
  });
  meta = {
    description = "FLIR camera Description package";
  };
})
