{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap,
  substituteSource,
}:
let
  sources = rec {
    dynamic_edt_3d = substituteSource {
      src = fetchgit {
        name = "dynamic_edt_3d-source";
        url = "https://github.com/ros2-gbp/octomap-release.git";
        rev = "0915c4cff28e454f7fe2ac3338d5550f466cbcfb";
        hash = "sha256-w1VOjU0mpO24Z2FAcdzCrmrRF6p7q2M/GbXhGlh3K0w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamic_edt_3d";
  version = "1.10.0-4";
  src = sources.dynamic_edt_3d;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ octomap ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The dynamicEDT3D library implements an inrementally updatable Euclidean distance transform (EDT) in 3D. It comes with a wrapper to use the OctoMap 3D representation and hooks into the change detection of the OctoMap library to propagate changes to the EDT.";
  };
}
