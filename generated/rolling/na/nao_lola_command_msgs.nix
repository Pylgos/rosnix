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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nao_lola_command_msgs-5b8562298bce0b0a607fa4df2833d91c3ef3ed61 = substituteSource {
      src = fetchgit {
        name = "nao_lola_command_msgs-5b8562298bce0b0a607fa4df2833d91c3ef3ed61-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "5b8562298bce0b0a607fa4df2833d91c3ef3ed61";
        hash = "sha256-IndgGzImBnJw0rE9ABJUpaTnide4Sgyo0iQGNQ2MAC0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_lola_command_msgs";
  version = "1.3.0-1";
  src = sources.nao_lola_command_msgs-5b8562298bce0b0a607fa4df2833d91c3ef3ed61;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package defining command msgs to be sent to NAO robot.";
  };
}
