{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    pal_statistics_msgs = substituteSource {
      src = fetchgit {
        name = "pal_statistics_msgs-source";
        url = "https://github.com/ros2-gbp/pal_statistics-release.git";
        rev = "6c866cbe77d964560c81d9c184c06d1371661686";
        hash = "sha256-8QGt/RdBUUO5MaWpDpaVy7xWuLywg94gm/Gmo1J8GiY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_statistics_msgs";
  version = "2.2.4-1";
  src = sources.pal_statistics_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Statistics msgs package";
  };
}
