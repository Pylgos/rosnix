{
  buildRosPackage,
  cmake,
  curl,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  glog,
  pcl,
  python3Packages,
  substituteSource,
  xmlrpc_c,
}:
let
  sources = rec {
    ifm3d_core = substituteSource {
      src = fetchgit {
        name = "ifm3d_core-source";
        url = "https://github.com/ros2-gbp/ifm3d-release.git";
        rev = "a24997b1557ad4919fe504bf6ac3580cac5f6e46";
        hash = "sha256-uR93fGa2he8/x1p8bZM2xobrFhbm7cnUGAw341qYlOE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ifm3d_core";
  version = "0.18.0-10";
  src = sources.ifm3d_core;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge glog pcl python3Packages.boost xmlrpc_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Library and Utilities for working with ifm pmd-based 3D ToF Cameras";
  };
}
