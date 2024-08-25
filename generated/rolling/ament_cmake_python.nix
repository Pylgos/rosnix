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
    ament_cmake_python = substituteSource {
      src = fetchgit {
        name = "ament_cmake_python-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "dfbde5f2a7f33cea2ae2f62aaa57d9cf32ad6a46";
        hash = "sha256-+wNbJHCtJN8EjDFt/V0iTnotL1OxxXX9LwsrwRPoaOk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_python";
  version = "2.7.0-1";
  src = sources.ament_cmake_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to use Python in the ament buildsystem in CMake.";
  };
}
