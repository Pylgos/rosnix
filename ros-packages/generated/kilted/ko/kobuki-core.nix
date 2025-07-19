{
  ament-cmake-ros,
  buildAmentCmakePackage,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "kobuki_core";
  version = "1.4.0-4";
  src = finalAttrs.passthru.sources."kobuki_core";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-command-line ecl-config ecl-console ecl-converters ecl-devices ecl-geometry ecl-mobile-robot ecl-sigslots ecl-threads ecl-time ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-command-line ecl-config ecl-console ecl-converters ecl-devices ecl-geometry ecl-mobile-robot ecl-sigslots ecl-threads ecl-time ];
  passthru.sources = mkSourceSet (sources: {
    "kobuki_core" = substituteSource {
      src = fetchgit {
        name = "kobuki_core-source";
        url = "https://github.com/ros2-gbp/kobuki_core-release.git";
        rev = "1d58be6202c24fec302b6f2e230eae2e53270e38";
        hash = "sha256-Bq/+5lnLAiJ2HQtIr0h6wB08J7OxRxT4YhcLHIrCUwI=";
      };
    };
  });
  meta = {
    description = "\n    Pure C++ driver library for Kobuki.\n  ";
  };
})
