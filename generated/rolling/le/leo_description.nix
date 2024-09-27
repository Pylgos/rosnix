{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  robot_state_publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    leo_description-fb10fa4cfb080e6967126b19ac1abc4c85aa85f0 = substituteSource {
      src = fetchgit {
        name = "leo_description-fb10fa4cfb080e6967126b19ac1abc4c85aa85f0-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "fb10fa4cfb080e6967126b19ac1abc4c85aa85f0";
        hash = "sha256-Yi8hUp1UDui0Zdzwx6JhxHXBD4N3/L36/mN0dwOHufY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_description";
  version = "3.0.3-1";
  src = sources.leo_description-fb10fa4cfb080e6967126b19ac1abc4c85aa85f0;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ robot_state_publisher xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "URDF Description package for Leo Rover";
  };
}
