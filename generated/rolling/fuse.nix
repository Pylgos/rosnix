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
        rev = "57fbf54cded896a2bfd424b9d4e17b51825eb505";
        hash = "sha256-MCn/++IrtwFkgmWkiy6/v6byBMQQEueRVUVsKFjvpyE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse";
  version = "1.2.0-1";
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
