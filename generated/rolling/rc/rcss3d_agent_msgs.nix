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
    rcss3d_agent_msgs-f77c39ad9b2617e0ae8097535ecdea2e6720aae5 = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_msgs-f77c39ad9b2617e0ae8097535ecdea2e6720aae5-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "f77c39ad9b2617e0ae8097535ecdea2e6720aae5";
        hash = "sha256-AN/eyLroQDeZjI/JosPYI5tZHhbJn0jP1d8D3wjuN54=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcss3d_agent_msgs";
  version = "0.4.1-3";
  src = sources.rcss3d_agent_msgs-f77c39ad9b2617e0ae8097535ecdea2e6720aae5;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Custom messages for communicating with rcss3d_agent";
  };
}
