{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-containers,
  ecl-exceptions,
  ecl-formatters,
  ecl-license,
  ecl-linear-algebra,
  ecl-math,
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
  pname = "ecl_geometry";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_geometry";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-containers ecl-exceptions ecl-formatters ecl-license ecl-linear-algebra ecl-math ecl-mpl ecl-type-traits ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_geometry" = substituteSource {
      src = fetchgit {
        name = "ecl_geometry-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "6f23070b3de606ffa640f469551d3aa5e59a3e30";
        hash = "sha256-XXr9pl1hLn7gS04rAzdTRXa+Fe0p4Mn7sC0scLWC2Zc=";
      };
    };
  });
  meta = {
    description = "Any tools relating to mathematical geometry. Primarily featuring polynomials and interpolations.";
  };
})
