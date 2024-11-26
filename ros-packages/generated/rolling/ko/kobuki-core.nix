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
  version = "1.4.0-3";
  src = finalAttrs.passthru.sources."kobuki_core";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-command-line ecl-config ecl-console ecl-converters ecl-devices ecl-geometry ecl-mobile-robot ecl-sigslots ecl-threads ecl-time ];
  passthru = {
    sources = mkSourceSet (sources: {
      "kobuki_core" = substituteSource {
        src = fetchgit {
          name = "kobuki_core-source";
          url = "https://github.com/ros2-gbp/kobuki_core-release.git";
          rev = "ce29c096e4ed537b5d05fb85ab22a9ad2620cb3e";
          hash = "sha256-Bq/+5lnLAiJ2HQtIr0h6wB08J7OxRxT4YhcLHIrCUwI=";
        };
      };
    });
  };
  meta = {
    description = "Pure C++ driver library for Kobuki.";
  };
})
