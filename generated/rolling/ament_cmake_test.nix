{
  ament_cmake_core,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_test = substituteSource {
      src = fetchgit {
        name = "ament_cmake_test-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "431dcbf485bd5451b34eb1a3404a26423b468c3f";
        hash = "sha256-hdv+F61l4ScPYYjqwAGJatgwwfSMZGAdJktvjRGnflU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_test";
  version = "2.7.0-1";
  src = sources.ament_cmake_test;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [ ament_cmake_python ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to add tests in the ament buildsystem in CMake.";
  };
}
