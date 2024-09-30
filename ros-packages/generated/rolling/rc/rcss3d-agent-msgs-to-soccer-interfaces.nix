{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcss3d-agent-msgs,
  rosSystemPackages,
  soccer-vision-3d-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rcss3d_agent_msgs_to_soccer_interfaces" = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_msgs_to_soccer_interfaces-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "b3ef5116e011b8d30aec1b1bf373e08bb5fbcb0e";
        hash = "sha256-2bEjbfPy02UiTflYzF8AZb2bjZB/Xg1iHUC0deLs7UQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rcss3d-agent-msgs-to-soccer-interfaces";
  version = "0.4.1-3";
  src = sources."rcss3d_agent_msgs_to_soccer_interfaces";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcss3d-agent-msgs soccer-vision-3d-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Library with methods that convert rcss3d_agent_msgs to soccer_interfaces";
  };
}