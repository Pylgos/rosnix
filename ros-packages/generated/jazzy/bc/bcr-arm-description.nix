{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdf-tutorial,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bcr_arm_description";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."bcr_arm_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ urdf-tutorial ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ urdf-tutorial ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bcr_arm_description" = substituteSource {
      src = fetchgit {
        name = "bcr_arm_description-source";
        url = "https://github.com/ros2-gbp/bcr_arm-release.git";
        rev = "b756d30083d6370ff546ca0b07a03d4fd53ca97d";
        hash = "sha256-YryExwKiOPRoi9bf6SNu2zrjE6afxWWgiybC+zMhgHM=";
      };
    };
  });
  meta = {
    description = "robot description files including urdf, meshes and launch files for the bcr arm";
  };
})
