{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clearpath-config,
  clearpath-control,
  clearpath-description,
  clearpath-diagnostics,
  clearpath-manipulators,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-setup-srdf-plugins,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_generator_common";
  version = "2.9.1-1";
  src = finalAttrs.passthru.sources."clearpath_generator_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-config clearpath-control clearpath-description clearpath-diagnostics clearpath-manipulators moveit-setup-srdf-plugins ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-apt" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-config clearpath-control clearpath-description clearpath-diagnostics clearpath-manipulators moveit-setup-srdf-plugins ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-apt" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_generator_common" = substituteSource {
      src = fetchgit {
        name = "clearpath_generator_common-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "8580bc01e7f2f572c5677de341201b7212380d7b";
        hash = "sha256-9G4GxBoPqolNAkwlA/ei5m70vGEqXNlldLHZTtWSoh0=";
      };
    };
  });
  meta = {
    description = "Clearpath Common Generator";
  };
})
