{
  ament-cmake-ros,
  buildAmentCmakePackage,
  ecl-build,
  ecl-command-line,
  ecl-config,
  ecl-containers,
  ecl-converters,
  ecl-devices,
  ecl-errors,
  ecl-exceptions,
  ecl-formatters,
  ecl-geometry,
  ecl-ipc,
  ecl-license,
  ecl-linear-algebra,
  ecl-sigslots,
  ecl-streams,
  ecl-threads,
  ecl-time-lite,
  ecl-type-traits,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_core_apps";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_core_apps";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-command-line ecl-config ecl-containers ecl-converters ecl-devices ecl-errors ecl-exceptions ecl-formatters ecl-geometry ecl-ipc ecl-license ecl-linear-algebra ecl-sigslots ecl-streams ecl-threads ecl-time-lite ecl-type-traits ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-command-line ecl-config ecl-containers ecl-converters ecl-devices ecl-errors ecl-exceptions ecl-formatters ecl-geometry ecl-ipc ecl-license ecl-linear-algebra ecl-sigslots ecl-streams ecl-threads ecl-time-lite ecl-type-traits ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_core_apps" = substituteSource {
      src = fetchgit {
        name = "ecl_core_apps-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "ba34ad25a3cf2830523653dfcf6428cc69b26adb";
        hash = "sha256-s2Ebyn5n1kiUIFSZ3pa4Ycrcv+Zxp6fh/XBk2xxjWbI=";
      };
    };
  });
  meta = {
    description = "\n     This includes a suite of programs demo'ing various aspects of the\n     ecl_core. It also includes various benchmarking and utility programs for\n     use primarily with embedded systems.\n  ";
  };
})
