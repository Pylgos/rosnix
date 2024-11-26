{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-license,
  ecl-linear-algebra,
  ecl-mpl,
  ecl-type-traits,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_statistics";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_statistics";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-license ecl-linear-algebra ecl-mpl ecl-type-traits ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ecl_statistics" = substituteSource {
        src = fetchgit {
          name = "ecl_statistics-source";
          url = "https://github.com/ros2-gbp/ecl_core-release.git";
          rev = "c0e8d8dd7d93057ac24bd8beac89d9212a1a99a2";
          hash = "sha256-znVdvA/1rSX25k4ZeeWg3ageP91ua9cDRosJ2FCTUyo=";
        };
      };
    });
  };
  meta = {
    description = "Common statistical structures and algorithms for control systems.";
  };
})
