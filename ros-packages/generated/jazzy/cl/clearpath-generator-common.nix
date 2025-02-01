{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clearpath-config,
  clearpath-control,
  clearpath-description,
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
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."clearpath_generator_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ clearpath-config clearpath-control clearpath-description clearpath-manipulators moveit-setup-srdf-plugins ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_generator_common" = substituteSource {
      src = fetchgit {
        name = "clearpath_generator_common-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "87d3508cf8505ae256a78fe6821cd33f9b1b5f93";
        hash = "sha256-EKxzhO4k934ebNqS2OjqG3ToB1rjbyyc7SSWUEWENF4=";
      };
    };
  });
  meta = {
    description = "Clearpath Common Generator";
  };
})
