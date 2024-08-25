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
        rev = "91b12807120ab8de6c0d05950e34f2c4a06deb99";
        hash = "sha256-NFG6kVGH2H4vvpAx8RitTa4EbTDg6/iPGJNwV2RdozE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pendulum_msgs";
  version = "0.34.2-1";
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
