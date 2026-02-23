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
  version = "2.9.1-1";
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
        rev = "b9c93d7dd6b64c6de997fbcf5769f3d3a441a515";
        hash = "sha256-zHgDDOrEuVoSphFllnLTyy/ATKGYdD8FnFqUaBf4pCo=";
      };
    };
  });
  meta = {
    description = "Clearpath manipulator URDF descriptions";
  };
})
