{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_uncrustify,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_uncrustify = substituteSource {
      src = fetchgit {
        name = "ament_cmake_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "efebef7b70c55c2f4001c5955c5b06d06a736a19";
        hash = "sha256-K+nAwXcoj7oyJgT+1aLuomdj6Y9zjGP6P7Lq9ZKU1pY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_uncrustify";
  version = "0.18.1-1";
  src = sources.ament_cmake_uncrustify;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_uncrustify ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test ament_uncrustify ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_uncrustify to check code against styleconventions using uncrustify.";
  };
}
