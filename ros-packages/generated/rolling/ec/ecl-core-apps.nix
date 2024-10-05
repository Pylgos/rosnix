{
  ament-cmake-ros,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "ecl_core_apps" = substituteSource {
      src = fetchgit {
        name = "ecl_core_apps-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "227a5819e1b551c2ea941998b477d83e739d2007";
        hash = "sha256-s2Ebyn5n1kiUIFSZ3pa4Ycrcv+Zxp6fh/XBk2xxjWbI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "ecl_core_apps";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_core_apps";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl-build ecl-command-line ecl-config ecl-containers ecl-converters ecl-devices ecl-errors ecl-exceptions ecl-formatters ecl-geometry ecl-ipc ecl-license ecl-linear-algebra ecl-sigslots ecl-streams ecl-threads ecl-time-lite ecl-type-traits ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "This includes a suite of programs demo'ing various aspects of the ecl_core. It also includes various benchmarking and utility programs for use primarily with embedded systems.";
  };
})
