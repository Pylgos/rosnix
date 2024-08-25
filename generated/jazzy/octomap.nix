{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    octomap = substituteSource {
      src = fetchgit {
        name = "octomap-source";
        url = "https://github.com/ros2-gbp/octomap-release.git";
        rev = "895657943d1ba59b781d1c1da097dab12568b016";
        hash = "sha256-kIh/20gkpK5nfe4T87wUfoECW0QNMp8f7M73+FJqmUE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap";
  version = "1.10.0-4";
  src = sources.octomap;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The OctoMap library implements a 3D occupancy grid mapping approach, providing data structures and mapping algorithms in C++. The map implementation is based on an octree. See http://octomap.github.io for details.";
  };
}
