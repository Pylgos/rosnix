{
  ament_cmake,
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
    pendulum_msgs = substituteSource {
      src = fetchgit {
        name = "pendulum_msgs-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "feb51dfce9be20ca78e706894a6d81bf29a4f116";
        hash = "sha256-mywKB3uFB5Pi+7HIUy7am5JdzrkF+Sg8WQzsQvUrptU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pendulum_msgs";
  version = "0.33.4-1";
  src = sources.pendulum_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Custom messages for real-time pendulum control.";
  };
}
