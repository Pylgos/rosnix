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
  version = "2.6.4-1";
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
        rev = "ac70647fd263170e27e06548763a1f5035309f80";
        hash = "sha256-Mhr2WTZy4uxCx1Uc5sk+oyU+rL6bMJGwGD/CrE9KkLg=";
      };
    };
  });
  meta = {
    description = "Clearpath Common Generator";
  };
})
