{
  ament_cmake_core,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2_core,
  mrt_cmake_modules,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_maps = substituteSource {
      src = fetchFromGitHub {
        name = "lanelet2_maps-source";
        owner = "ros2-gbp";
        repo = "lanelet2-release";
        rev = "db6403e91180c4a93b2ce17ee7bb21667fbda6ad";
        hash = "sha256-neyAYG4BaHOn/2vqAXGTk6mFwmVeutNUc/jdcl7B1HY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_maps";
  version = "1.2.1-6";
  src = sources.lanelet2_maps;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ mrt_cmake_modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lanelet2_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Example maps in the lanelet2-format";
  };
}
