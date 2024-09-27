{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    urg_node_msgs-9cd9bea8dd2eba058dfa171b3378be85bff29c4f = substituteSource {
      src = fetchgit {
        name = "urg_node_msgs-9cd9bea8dd2eba058dfa171b3378be85bff29c4f-source";
        url = "https://github.com/ros2-gbp/urg_node_msgs-release.git";
        rev = "9cd9bea8dd2eba058dfa171b3378be85bff29c4f";
        hash = "sha256-IBl7J8akPgn5ni5/8kPGDOh4Fklto+RggWCIxGald/w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urg_node_msgs";
  version = "1.0.1-8";
  src = sources.urg_node_msgs-9cd9bea8dd2eba058dfa171b3378be85bff29c4f;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "urg_node_msgs";
  };
}
