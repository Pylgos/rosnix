{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  ecl-build,
  ecl-config,
  ecl-errors,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ecl_filesystem" = substituteSource {
      src = fetchgit {
        name = "ecl_filesystem-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "f05b4974145c3bf020724e07908c1d00e621c44c";
        hash = "sha256-b9AmUCVBFQ84JFx0ER/eD+2NF6JP/zybtNFnzKAI+dg=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ecl_filesystem";
  version = "1.2.1-5";
  src = sources."ecl_filesystem";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl-build ecl-config ecl-errors ecl-license ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Cross platform filesystem utilities (until c++11 makes its way in).";
  };
}
