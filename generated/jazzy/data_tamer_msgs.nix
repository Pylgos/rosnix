{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    data_tamer_msgs = substituteSource {
      src = fetchgit {
        name = "data_tamer_msgs-source";
        url = "https://github.com/ros2-gbp/data_tamer-release.git";
        rev = "38fab093efa7d483c5039f181a3a0254bdf6184a";
        hash = "sha256-NxB4rc0pONAAz2IJs4m7OQeB4K5aF+RNCRjmwkRbjLc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "data_tamer_msgs";
  version = "0.9.4-4";
  src = sources.data_tamer_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Interfaces for data_tamer";
  };
}
