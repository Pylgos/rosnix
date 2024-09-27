{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    pendulum_msgs-91b12807120ab8de6c0d05950e34f2c4a06deb99 = substituteSource {
      src = fetchgit {
        name = "pendulum_msgs-91b12807120ab8de6c0d05950e34f2c4a06deb99-source";
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
  src = sources.pendulum_msgs-91b12807120ab8de6c0d05950e34f2c4a06deb99;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Custom messages for real-time pendulum control.";
  };
}
