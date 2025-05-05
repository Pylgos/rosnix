{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-converters,
  ecl-errors,
  ecl-exceptions,
  ecl-formatters,
  ecl-license,
  ecl-mpl,
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
  pname = "ecl_containers";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_containers";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-config ecl-converters ecl-errors ecl-exceptions ecl-formatters ecl-license ecl-mpl ecl-type-traits ecl-utilities ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-converters ecl-errors ecl-exceptions ecl-formatters ecl-license ecl-mpl ecl-type-traits ecl-utilities ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_containers" = substituteSource {
      src = fetchgit {
        name = "ecl_containers-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "b06753c443575d5f82ed4a98aa1933c674737437";
        hash = "sha256-943O8bp1zs58toB05o+e+e5rOiiB7i0OAWEjrbjQ7Ng=";
      };
    };
  });
  meta = {
    description = "\n    The containers included here are intended to extend the stl containers.\n    In all cases, these implementations are designed to implement\n    c++ conveniences and safety where speed is not sacrificed.\n\n    Also includes techniques for memory debugging of common problems such\n    as buffer overruns.\n  ";
  };
})
