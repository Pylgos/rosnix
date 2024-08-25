{
  ament_cmake_core,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  gtest_vendor,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_gtest = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gtest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "1449389d4509d65830ab164cce5700edd6d800f4";
        hash = "sha256-YciA2zVQz/s8E5H9riC/gXb6pQGowQ9dbPIxQxhqACk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_gtest";
  version = "2.5.2-1";
  src = sources.ament_cmake_gtest;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test gtest gtest_vendor ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test gtest gtest_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to add gtest-based tests in the ament buildsystem in CMake.";
  };
}
