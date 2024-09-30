{
  ament-cmake,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rcss3d_agent_msgs" = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_msgs-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "a19aa68dfd8b67bf49b04821bbb990650ebff241";
        hash = "sha256-AN/eyLroQDeZjI/JosPYI5tZHhbJn0jP1d8D3wjuN54=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rcss3d_agent_msgs";
  version = "0.4.1-4";
  src = sources."rcss3d_agent_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Custom messages for communicating with rcss3d_agent";
  };
}
