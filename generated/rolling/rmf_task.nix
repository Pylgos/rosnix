{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_battery,
  rmf_utils,
  substituteSource,
}:
let
  sources = rec {
    rmf_task = substituteSource {
      src = fetchgit {
        name = "rmf_task-source";
        url = "https://github.com/ros2-gbp/rmf_task-release.git";
        rev = "df2036e77df3547d8bb9f5d80b23c0cb12c48d25";
        hash = "sha256-KAVo9k6pT8cr4ouHJLklaxOEkLl6sZM9+9pSSOTBs+c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task";
  version = "2.6.0-1";
  src = sources.rmf_task;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rmf_battery rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ];
  missingDependencies = [  ];
  meta = {
    description = "Package for managing tasks in the Robotics Middleware Framework";
  };
}
