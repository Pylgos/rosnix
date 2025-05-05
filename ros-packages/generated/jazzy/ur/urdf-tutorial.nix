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
  version = "1.1.0-3";
  src = finalAttrs.passthru.sources."urdf_tutorial";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ urdf-launch ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ urdf-launch ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "urdf_tutorial" = substituteSource {
      src = fetchgit {
        name = "urdf_tutorial-source";
        url = "https://github.com/ros2-gbp/urdf_tutorial-release.git";
        rev = "768fb035b41a3366d0bd4c5088643a7b8b411276";
        hash = "sha256-is2/qeO2wFsbEBxJ8Kf0u+3EkFtbejI8nZpazjXVziM=";
      };
    };
  });
  meta = {
    description = "This package contains a number of URDF tutorials.";
  };
})
