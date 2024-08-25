{
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  elfutils,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    backward_ros = substituteSource {
      src = fetchgit {
        name = "backward_ros-source";
        url = "https://github.com/ros2-gbp/backward_ros-release.git";
        rev = "5a2e2816c743af43c84af47fbb3062add53e9a38";
        hash = "sha256-bWsmqFK/qWWpbhuWLQpYSQyNWcbHbMKq/ACVsHa/Vf0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "backward_ros";
  version = "1.0.5-1";
  src = sources.backward_ros;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ elfutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The backward_ros package is a ros wrapper of backward-cpp from https://github.com/bombela/backward-cpp";
  };
}
