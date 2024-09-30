{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "nao_command_msgs" = substituteSource {
      src = fetchgit {
        name = "nao_command_msgs-source";
        url = "https://github.com/ros2-gbp/nao_interfaces-release.git";
        rev = "ea53b2010b67766e1da4c0ef037aa07e0dda1ea8";
        hash = "sha256-geYK5hMHI66LcCD6GJ3Lr8T0ocK3/ExFHKKq9kBUZRs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nao_command_msgs";
  version = "1.0.0-2";
  src = sources."nao_command_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package defining command msgs to be sent to NAO robot.";
  };
}
