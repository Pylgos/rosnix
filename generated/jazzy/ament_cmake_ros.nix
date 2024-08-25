{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  domain_coordinator,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_ros = substituteSource {
      src = fetchgit {
        name = "ament_cmake_ros-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "3e2e92d82c1ae9b9a284684ae48601bfa3ca32fe";
        hash = "sha256-tT6X6MXP8iTsdlyNk33jdPbZZT+sWXvuIn8cTnvTYyw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_ros";
  version = "0.12.0-3";
  src = sources.ament_cmake_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest domain_coordinator ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest domain_coordinator ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The ROS specific CMake bits in the ament buildsystem.";
  };
}
