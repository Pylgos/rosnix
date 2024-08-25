{
  ament_cmake,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    vrpn = substituteSource {
      src = fetchgit {
        name = "vrpn-source";
        url = "https://github.com/ros2-gbp/vrpn-release.git";
        rev = "0b68703610a8b017be5d3b8a773b7dfaa63103ab";
        hash = "sha256-2oOc4KpLGkfRc8tNDvM7xxjiHahtaoa5tGYhQEA7ViA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vrpn";
  version = "7.35.0-18";
  src = sources.vrpn;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The VRPN is a library and set of servers that interfaces with virtual-reality systems, such as VICON, OptiTrack, and others.";
  };
}
