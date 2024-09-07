{
  ament_cmake,
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
    marti_introspection_msgs = substituteSource {
      src = fetchgit {
        name = "marti_introspection_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "f90e8526d34aab64ae1e832bddea4cf2fe2e6cd3";
        hash = "sha256-4kJB+fMKvdSRrPrfPYQWhTqKrWVfqg2QFGLDDDiVjGs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_introspection_msgs";
  version = "1.6.1-1";
  src = sources.marti_introspection_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "marti_introspection_msgs";
  };
}
