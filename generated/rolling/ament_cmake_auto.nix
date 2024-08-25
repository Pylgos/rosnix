{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_auto = substituteSource {
      src = fetchgit {
        name = "ament_cmake_auto-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "8f76a31f6bc50db1ff8a3622c11044b656ee1eec";
        hash = "sha256-42Cg+ZwQwpaxV7g8ZCFVitJr/X9cdrDiTDhCvH+sTEo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_auto";
  version = "2.7.0-1";
  src = sources.ament_cmake_auto;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The auto-magic functions for ease to use of the ament buildsystem in CMake.";
  };
}
