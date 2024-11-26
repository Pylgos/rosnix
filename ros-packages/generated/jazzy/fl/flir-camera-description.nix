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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."flir_camera_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "flir_camera_description" = substituteSource {
      src = fetchgit {
        name = "flir_camera_description-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "61dbafbac304c6e93a237fa228c0dc5a11c42a97";
        hash = "sha256-juVFZYQShq5XUOWXlJHXaXr1K7IdudyEJwkcGYIaFz4=";
      };
    };
  });
  meta = {
    description = "FLIR camera Description package";
  };
})
