{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_include_directories = substituteSource {
      src = fetchgit {
        name = "ament_cmake_include_directories-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "6c88290f63bb64fa01e4fd921367aa6dcb3d4f66";
        hash = "sha256-mHbidv+hkLxllxdei80Cktu9DqrDEm7uHjyGmQI+G74=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_include_directories";
  version = "2.7.0-1";
  src = sources.ament_cmake_include_directories;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The functionality to order include directories according to a chain of prefixes in the ament buildsystem in CMake.";
  };
}
