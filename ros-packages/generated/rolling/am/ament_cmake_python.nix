{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_python-dfbde5f2a7f33cea2ae2f62aaa57d9cf32ad6a46 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_python-dfbde5f2a7f33cea2ae2f62aaa57d9cf32ad6a46-source";
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
  src = sources.ament_cmake_python-dfbde5f2a7f33cea2ae2f62aaa57d9cf32ad6a46;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to use Python in the ament buildsystem in CMake.";
  };
}
