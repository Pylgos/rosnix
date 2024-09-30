{
  ament-cmake,
  ament-lint-common,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "urg_node_msgs" = substituteSource {
      src = fetchgit {
        name = "urg_node_msgs-source";
        url = "https://github.com/ros2-gbp/urg_node_msgs-release.git";
        rev = "b30be43c2ffbe917e1db13776e191089eebc5d17";
        hash = "sha256-IBl7J8akPgn5ni5/8kPGDOh4Fklto+RggWCIxGald/w=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "urg_node_msgs";
  version = "1.0.1-9";
  src = sources."urg_node_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "urg_node_msgs";
  };
}
