{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cppcheck" "gtest" "iwyu" "lcov" "libclang-dev" ]; };
  meta = {
    description = "Contains boilerplate cmake script, macros and utils";
  };
}
