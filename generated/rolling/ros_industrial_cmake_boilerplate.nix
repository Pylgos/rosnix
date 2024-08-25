{
  buildRosPackage,
  clang,
  cmake,
  cppcheck,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  include-what-you-use,
  lcov,
  substituteSource,
}:
let
  sources = rec {
    ros_industrial_cmake_boilerplate = substituteSource {
      src = fetchgit {
        name = "ros_industrial_cmake_boilerplate-source";
        url = "https://github.com/ros2-gbp/ros_industrial_cmake_boilerplate-release.git";
        rev = "955034a0e53d423d818c9d966f88ea1e002e06d3";
        hash = "sha256-yxsr0rMyvBYeoeMkhnWs1wSUR+qmZ66S/z9WOpMtRwk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_industrial_cmake_boilerplate";
  version = "0.5.4-1";
  src = sources.ros_industrial_cmake_boilerplate;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ clang cppcheck gtest include-what-you-use lcov ];
  missingDependencies = [  ];
  meta = {
    description = "Contains boilerplate cmake script, macros and utils";
  };
}
