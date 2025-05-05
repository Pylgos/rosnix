{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-license,
  ecl-type-traits,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_concepts";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_concepts";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-config ecl-license ecl-type-traits ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-license ecl-type-traits ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_concepts" = substituteSource {
      src = fetchgit {
        name = "ecl_concepts-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "a0348c6d3a69b498f2e10dc009637ae7751e6329";
        hash = "sha256-hH2MIha8e5l0G1CqvBSjisV52RKAkaE0J9ZtGpxM9EM=";
      };
    };
  });
  meta = {
    description = "\n     Introduces a compile time concept checking mechanism that can be used\n     most commonly to check for required functionality when passing\n     template arguments.\n  ";
  };
})
