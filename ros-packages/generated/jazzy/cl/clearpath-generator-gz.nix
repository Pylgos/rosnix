{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clearpath-config,
  clearpath-generator-common,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ptz-action-server-msgs,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_generator_gz";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."clearpath_generator_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ clearpath-config clearpath-generator-common cv-bridge ptz-action-server-msgs sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_generator_gz" = substituteSource {
      src = fetchgit {
        name = "clearpath_generator_gz-source";
        url = "https://github.com/clearpath-gbp/clearpath_simulator-release.git";
        rev = "16e0a21fd580b64bc30733a82c4d4be3c8432d2e";
        hash = "sha256-4rVlfj5s6ZGdV/3j3KCwRHOWpWzp/b49h9gM938yRlA=";
      };
    };
  });
  meta = {
    description = "Clearpath Gazebo Generator";
  };
})
