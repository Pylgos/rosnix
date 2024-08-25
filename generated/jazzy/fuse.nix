{
  ament_cmake,
  buildRosPackage,
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
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    fuse = substituteSource {
      src = fetchgit {
        name = "fuse-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
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
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fuse_constraints fuse_core fuse_doc fuse_graphs fuse_models fuse_msgs fuse_optimizers fuse_publishers fuse_variables fuse_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The fuse metapackage.";
  };
}
