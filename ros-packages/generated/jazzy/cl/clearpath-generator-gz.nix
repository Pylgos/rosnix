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
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."clearpath_generator_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-config clearpath-generator-common cv-bridge ptz-action-server-msgs sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-config clearpath-generator-common cv-bridge ptz-action-server-msgs sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_generator_gz" = substituteSource {
      src = fetchgit {
        name = "clearpath_generator_gz-source";
        url = "https://github.com/clearpath-gbp/clearpath_simulator-release.git";
        rev = "700cc7f81330056bcfc2979af101f7e1a61683f8";
        hash = "sha256-CR2tlOU55aJn9MrdzEhPZ3wyM+gYz5xKUZblBcZ3D0M=";
      };
    };
  });
  meta = {
    description = "Clearpath Gazebo Generator";
  };
})
