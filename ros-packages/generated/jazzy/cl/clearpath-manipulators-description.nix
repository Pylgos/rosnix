{
  ament-cmake,
  buildAmentCmakePackage,
  ewellix-description,
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
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."clearpath_manipulators_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ewellix-description robot-state-publisher robotiq-description ur-description urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ewellix-description robot-state-publisher robotiq-description ur-description urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_manipulators_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_manipulators_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "37832e386e3e2cb786b31ee927d8c8510bb74e45";
        hash = "sha256-BL2uxsHrxHOeJ/CC7Mj5ajpqXBJJP1Jgbo1gWWC0f/8=";
      };
    };
  });
  meta = {
    description = "Clearpath manipulator URDF descriptions";
  };
})
