{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    fastcdr = substituteSource {
      src = fetchgit {
        name = "fastcdr-source";
        url = "https://github.com/ros2-gbp/fastcdr-release.git";
        rev = "88698600fccc8bee85c04825020673097f7a6422";
        hash = "sha256-/KJcVY0p1qX56K44c6u5ZwcgzQHKUcHmqTeBWyZTyes=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fastcdr";
  version = "2.2.2-1";
  src = sources.fastcdr;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "*eProsima Fast CDR* is a C++ serialization library implementing the Common Data Representation (CDR) mechanism defined by the Object Management Group (OMG) consortium. CDR is the serialization mechanism used in DDS for the DDS Interoperability Wire Protocol (DDSI-RTPS).";
  };
}
