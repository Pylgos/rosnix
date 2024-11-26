{
  ament-cmake-ros,
  buildAmentCmakePackage,
  ecl-command-line,
  ecl-concepts,
  ecl-containers,
  ecl-converters,
  ecl-core-apps,
  ecl-devices,
  ecl-eigen,
  ecl-exceptions,
  ecl-formatters,
  ecl-geometry,
  ecl-ipc,
  ecl-linear-algebra,
  ecl-math,
  ecl-mpl,
  ecl-sigslots,
  ecl-statistics,
  ecl-streams,
  ecl-threads,
  ecl-time,
  ecl-type-traits,
  ecl-utilities,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_core";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_core";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-command-line ecl-concepts ecl-containers ecl-converters ecl-core-apps ecl-devices ecl-eigen ecl-exceptions ecl-formatters ecl-geometry ecl-ipc ecl-linear-algebra ecl-math ecl-mpl ecl-sigslots ecl-statistics ecl-streams ecl-threads ecl-time ecl-type-traits ecl-utilities ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ecl_core" = substituteSource {
        src = fetchgit {
          name = "ecl_core-source";
          url = "https://github.com/ros2-gbp/ecl_core-release.git";
          rev = "261e45bfe3c586f0d4be406fa40e4594eca4f5a5";
          hash = "sha256-/qmRsU0lb8R70sW/g5572zrbdGlRSBu3BL+GhX77UII=";
        };
      };
    });
  };
  meta = {
    description = "A set of tools and interfaces extending the capabilities of c++ to provide a lightweight, consistent interface with a focus for control programming.";
  };
})
