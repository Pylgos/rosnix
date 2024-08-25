{
  ament_cmake_core,
  ament_cmake_gtest,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gmock_vendor,
  gtest,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_gmock = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gmock-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "56d7c42d30dc1cea2e9d76b058261434bd25e471";
        hash = "sha256-VF2IxTBFW4xIEUlqG1/jH6IdY7a9xtjueNzlC3NqZ7s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_gmock";
  version = "2.7.0-1";
  src = sources.ament_cmake_gmock;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_gtest ament_cmake_test gmock_vendor gtest ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_gtest ament_cmake_test gmock_vendor gtest ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to add Google mock-based tests in the ament buildsystem in CMake.";
  };
}
