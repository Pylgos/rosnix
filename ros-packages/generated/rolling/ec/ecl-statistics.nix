{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "ecl_statistics" = substituteSource {
      src = fetchgit {
        name = "ecl_statistics-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "c0e8d8dd7d93057ac24bd8beac89d9212a1a99a2";
        hash = "sha256-znVdvA/1rSX25k4ZeeWg3ageP91ua9cDRosJ2FCTUyo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ecl_statistics";
  version = "1.2.1-4";
  src = sources."ecl_statistics";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl-build ecl-config ecl-license ecl-linear-algebra ecl-mpl ecl-type-traits ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Common statistical structures and algorithms for control systems.";
  };
}
