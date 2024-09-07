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
        rev = "83f032490db157d7ed8370f619b4c1c66a1f357b";
        hash = "sha256-1JWm79OTUZtFSw5uQlLrFJa7pFC4lPijuZdDjWMq3X4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pendulum_msgs";
  version = "0.33.5-1";
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
