{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_doc,
  fuse_graphs,
  fuse_models,
  fuse_msgs,
  fuse_optimizers,
  fuse_publishers,
  fuse_variables,
  fuse_viz,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    fuse = substituteSource {
      src = fetchFromGitHub {
        name = "fuse-source";
        owner = "ros2-gbp";
        repo = "fuse-release";
        rev = "146b505aa3208d25a2e7c1b5d170efc44094bc45";
        hash = "sha256-L7mooOifcCJDLiXwk0are7MS7SnxR8s1MrIPCwexfD4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse";
  version = "1.1.1-1";
  src = sources.fuse;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fuse_constraints fuse_core fuse_doc fuse_graphs fuse_models fuse_msgs fuse_optimizers fuse_publishers fuse_variables fuse_viz ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The fuse metapackage.";
  };
}
