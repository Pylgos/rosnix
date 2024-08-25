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
  substituteSource,
}:
let
  sources = rec {
    ecl_mpl = substituteSource {
      src = fetchgit {
        name = "ecl_mpl-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "dbcec2bc48eba197df4b3795e1fce8bb119b96ff";
        hash = "sha256-b7VJovFqbuLBco3qEl5r57uuO7wTyZrjQSNR6hNX00k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_mpl";
  version = "1.2.1-5";
  src = sources.ecl_mpl;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Metaprogramming tools move alot of runtime calculations to be shifted to compile time. This has only very elementary structures at this stage.";
  };
}
