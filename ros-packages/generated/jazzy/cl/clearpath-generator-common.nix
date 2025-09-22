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
  version = "2.7.4-1";
  src = finalAttrs.passthru.sources."clearpath_generator_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-config clearpath-control clearpath-description clearpath-diagnostics clearpath-manipulators moveit-setup-srdf-plugins ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-config clearpath-control clearpath-description clearpath-diagnostics clearpath-manipulators moveit-setup-srdf-plugins ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_generator_common" = substituteSource {
      src = fetchgit {
        name = "clearpath_generator_common-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "d53de5843d6c4dac2f95fd2bc7649d2aa01d9814";
        hash = "sha256-QcA/FPsGi4AmcvdK1a8G1LNIxN/ZO2ezemJkO5kpeQU=";
      };
    };
  });
  meta = {
    description = "Clearpath Common Generator";
  };
})
