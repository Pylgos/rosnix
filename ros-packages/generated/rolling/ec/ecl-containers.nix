{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "ecl_containers" = substituteSource {
      src = fetchgit {
        name = "ecl_containers-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "892731f8c4692aee85993224927d18c845dfe360";
        hash = "sha256-943O8bp1zs58toB05o+e+e5rOiiB7i0OAWEjrbjQ7Ng=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ecl_containers";
  version = "1.2.1-4";
  src = sources."ecl_containers";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl-build ecl-config ecl-converters ecl-errors ecl-exceptions ecl-formatters ecl-license ecl-mpl ecl-type-traits ecl-utilities ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The containers included here are intended to extend the stl containers. In all cases, these implementations are designed to implement c++ conveniences and safety where speed is not sacrificed. Also includes techniques for memory debugging of common problems such as buffer overruns.";
  };
}
