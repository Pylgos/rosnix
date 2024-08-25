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
        rev = "09c03bebd52e95c6f5f92dc7dbe5071039b220fd";
        hash = "sha256-yxsr0rMyvBYeoeMkhnWs1wSUR+qmZ66S/z9WOpMtRwk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_industrial_cmake_boilerplate";
  version = "0.5.4-3";
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
