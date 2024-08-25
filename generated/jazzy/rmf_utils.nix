{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rmf_utils = substituteSource {
      src = fetchgit {
        name = "rmf_utils-source";
        url = "https://github.com/ros2-gbp/rmf_utils-release.git";
        rev = "45dfebf8e030a6c3a5817c41883b871daab829a1";
        hash = "sha256-v0ho2LvZxTvkDGnOgTDbMk3fKAsWxhTBqiV3M8emWxI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_utils";
  version = "1.6.2-1";
  src = sources.rmf_utils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ];
  missingDependencies = [  ];
  meta = {
    description = "Simple C++ programming utilities used by Robotics Middleware Framework packages";
  };
}
