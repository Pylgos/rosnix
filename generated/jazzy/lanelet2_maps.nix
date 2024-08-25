{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2_core,
  mrt_cmake_modules,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_maps = substituteSource {
      src = fetchgit {
        name = "lanelet2_maps-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "7704cae374e41e84d1549947a4c06afe5d55f061";
        hash = "sha256-neyAYG4BaHOn/2vqAXGTk6mFwmVeutNUc/jdcl7B1HY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_maps";
  version = "1.2.1-1";
  src = sources.lanelet2_maps;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Example maps in the lanelet2-format";
  };
}
