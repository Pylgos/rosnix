{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_mpl-9186cc900b97cb345537724e7118d21d3aa77c96 = substituteSource {
      src = fetchgit {
        name = "ecl_mpl-9186cc900b97cb345537724e7118d21d3aa77c96-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "9186cc900b97cb345537724e7118d21d3aa77c96";
        hash = "sha256-b7VJovFqbuLBco3qEl5r57uuO7wTyZrjQSNR6hNX00k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_mpl";
  version = "1.2.1-4";
  src = sources.ecl_mpl-9186cc900b97cb345537724e7118d21d3aa77c96;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_license ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metaprogramming tools move alot of runtime calculations to be shifted to compile time. This has only very elementary structures at this stage.";
  };
}
