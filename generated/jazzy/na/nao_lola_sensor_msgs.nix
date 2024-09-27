{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
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
    nao_lola_sensor_msgs-fe59a77b09ee5da05220551d7714d0099e545e04 = substituteSource {
      src = fetchgit {
        name = "nao_lola_sensor_msgs-fe59a77b09ee5da05220551d7714d0099e545e04-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "fe59a77b09ee5da05220551d7714d0099e545e04";
        hash = "sha256-I+mOw69Qd5OqCcNdvjpOn3LGw/W/7hPl71P0sgF+42k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_lola_sensor_msgs";
  version = "1.3.0-2";
  src = sources.nao_lola_sensor_msgs-fe59a77b09ee5da05220551d7714d0099e545e04;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package defining sensor msgs to be received from NAO robot.";
  };
}
