{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  robotiq-description,
  rosSystemPackages,
  substituteSource,
  ur-description,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_manipulators_description";
  version = "2.6.0-1";
  src = finalAttrs.passthru.sources."clearpath_manipulators_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ robot-state-publisher robotiq-description ur-description urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher robotiq-description ur-description urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_manipulators_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_manipulators_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "306f9fba86de7ab8a7daaa25f295109dd9722bce";
        hash = "sha256-Rx3gnb8xXWozOfFxlPofXSGGaV3JYAxYnr6VMWyFczA=";
      };
    };
  });
  meta = {
    description = "Clearpath manipulator URDF descriptions";
  };
})
