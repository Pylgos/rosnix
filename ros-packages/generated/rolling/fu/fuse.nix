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
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "fuse" = substituteSource {
      src = fetchgit {
        name = "fuse-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "d251c6eb221ff1b1b7e9c1189bce2e8d40cbfaba";
        hash = "sha256-tsigICiAe41pYCCetgVQ+FRHXKhctEb9mmfU/tnWBAs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "fuse";
  version = "1.2.1-1";
  src = sources."fuse";
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
