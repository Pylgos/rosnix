{
  ament_cmake_core,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_export_include_directories = substituteSource {
      src = fetchFromGitHub {
        name = "ament_cmake_export_include_directories-source";
        owner = "ros2-gbp";
        repo = "ament_cmake-release";
        rev = "a449a6678eabc030b949f77bb0a2b6b498120963";
        hash = "sha256-pjcnA/ljbFcDyP5o6+aHNcPLVbCsW41DB2wxjRl2rx4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_include_directories";
  version = "2.7.0-1";
  src = sources.ament_cmake_export_include_directories;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to export include directories to downstream packages in the ament buildsystem in CMake.";
  };
}
