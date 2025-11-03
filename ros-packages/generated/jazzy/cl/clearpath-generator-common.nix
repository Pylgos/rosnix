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
  version = "2.8.1-1";
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
        rev = "b35413fa9f6b341fee184d890782b9ecbdb4392e";
        hash = "sha256-NJbJ2UmCFLfz6Lx6aVgp8ZCDim7K15vPr/AvkXI4/Og=";
      };
    };
  });
  meta = {
    description = "Clearpath Common Generator";
  };
})
