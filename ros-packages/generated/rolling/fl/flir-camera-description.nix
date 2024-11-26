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
  passthru = {
    sources = mkSourceSet (sources: {
      "flir_camera_description" = substituteSource {
        src = fetchgit {
          name = "flir_camera_description-source";
          url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
          rev = "79fedf0bfc9249f83f55835b85ec35594999a770";
          hash = "sha256-juVFZYQShq5XUOWXlJHXaXr1K7IdudyEJwkcGYIaFz4=";
        };
      };
    });
  };
  meta = {
    description = "FLIR camera Description package";
  };
})
