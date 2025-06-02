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
  version = "2.5.0-1";
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
        rev = "87d848db22c846261adf20dbc4d1c9ec9d3c42b8";
        hash = "sha256-KoX4/S4hsyRsgwGMxleBcVq/HwCjlWcX+kz4JUmn5xg=";
      };
    };
  });
  meta = {
    description = "Clearpath manipulator URDF descriptions";
  };
})
