{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nav_2d_msgs = substituteSource {
      src = fetchgit {
        name = "nav_2d_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "a9c822105bb310b40213ebac743bc683effff5eb";
        hash = "sha256-E1znrBfE4nFmwe9ydNdASZ5ZRnnxX6SVvPv/kcXqIrs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav_2d_msgs";
  version = "1.3.1-1";
  src = sources.nav_2d_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Basic message types for two dimensional navigation, extending from geometry_msgs::Pose2D.";
  };
}
