{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    fastcdr-02db0eb89caa22d6a3638d86f5d31dcf0d645113 = substituteSource {
      src = fetchgit {
        name = "fastcdr-02db0eb89caa22d6a3638d86f5d31dcf0d645113-source";
        url = "https://github.com/ros2-gbp/fastcdr-release.git";
        rev = "02db0eb89caa22d6a3638d86f5d31dcf0d645113";
        hash = "sha256-h7TaahF7NZ1n4w5RhpK2ibHO8g0DNZwDz3omAy6sW9E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fastcdr";
  version = "2.2.4-1";
  src = sources.fastcdr-02db0eb89caa22d6a3638d86f5d31dcf0d645113;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "*eProsima Fast CDR* is a C++ serialization library implementing the Common Data Representation (CDR) mechanism defined by the Object Management Group (OMG) consortium. CDR is the serialization mechanism used in DDS for the DDS Interoperability Wire Protocol (DDSI-RTPS).";
  };
}
