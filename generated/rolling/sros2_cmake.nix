{
  ament_cmake,
  ament_cmake_test,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros2cli,
  sros2,
  substituteSource,
}:
let
  sources = rec {
    sros2_cmake = substituteSource {
      src = fetchgit {
        name = "sros2_cmake-source";
        url = "https://github.com/ros2-gbp/sros2-release.git";
        rev = "12a51521d0473892f40f6003e843e7e38d88bc5c";
        hash = "sha256-ioCjdjttYYVOAfbY/aoutslDt4R+3Jl0rBqwTHLBqqc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sros2_cmake";
  version = "0.15.1-1";
  src = sources.sros2_cmake;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli sros2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "CMake macros to configure security";
  };
}
