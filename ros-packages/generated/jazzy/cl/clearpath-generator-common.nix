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
  version = "2.5.1-1";
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
        rev = "ec6767323833795fd9a1ae0f04464e8bc63e0c0e";
        hash = "sha256-+NrM0caBAtUtMrS8i6HS61OZCX2mlxsLbb+PA5GzM3E=";
      };
    };
  });
  meta = {
    description = "Clearpath Common Generator";
  };
})
