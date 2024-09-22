{
  buildRosPackage,
  cv_bridge,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ifm3d_core = substituteSource {
      src = fetchFromGitHub {
        name = "ifm3d_core-source";
        owner = "ros2-gbp";
        repo = "ifm3d-release";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libgoogle-glog-dev" "libpcl-all-dev" "libxmlrpc-c++" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Library and Utilities for working with ifm pmd-based 3D ToF Cameras";
  };
}
