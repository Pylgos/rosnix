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
  version = "2.3.1-1";
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
        rev = "a68c55aedd205b998e25df78b95e8d7b6a0d009c";
        hash = "sha256-n4w+Va6dqolFF/UeXcOARNxmyX0WESQBHAhfhz8nKiA=";
      };
    };
  });
  meta = {
    description = "Clearpath Gazebo Generator";
  };
})
