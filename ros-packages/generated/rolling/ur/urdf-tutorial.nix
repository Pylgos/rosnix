{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdf-launch,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urdf_tutorial";
  version = "1.1.0-2";
  src = finalAttrs.passthru.sources."urdf_tutorial";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ urdf-launch ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "urdf_tutorial" = substituteSource {
      src = fetchgit {
        name = "urdf_tutorial-source";
        url = "https://github.com/ros2-gbp/urdf_tutorial-release.git";
        rev = "f50ad9cf19409844dee10830671567cdfff72c98";
        hash = "sha256-is2/qeO2wFsbEBxJ8Kf0u+3EkFtbejI8nZpazjXVziM=";
      };
    };
  });
  meta = {
    description = "This package contains a number of URDF tutorials.";
  };
})
