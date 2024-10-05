{
  ament-cmake-ros,
  buildRosPackage,
  ecl-build,
  ecl-command-line,
  ecl-config,
  ecl-console,
  ecl-converters,
  ecl-devices,
  ecl-geometry,
  ecl-mobile-robot,
  ecl-sigslots,
  ecl-threads,
  ecl-time,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "kobuki_core" = substituteSource {
      src = fetchgit {
        name = "kobuki_core-source";
        url = "https://github.com/ros2-gbp/kobuki_core-release.git";
        rev = "00876e81a32953ec6b09b474c2f8e82289245f75";
        hash = "sha256-Bq/+5lnLAiJ2HQtIr0h6wB08J7OxRxT4YhcLHIrCUwI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "kobuki_core";
  version = "1.4.0-4";
  src = finalAttrs.passthru.sources."kobuki_core";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl-build ecl-command-line ecl-config ecl-console ecl-converters ecl-devices ecl-geometry ecl-mobile-robot ecl-sigslots ecl-threads ecl-time ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Pure C++ driver library for Kobuki.";
  };
})
