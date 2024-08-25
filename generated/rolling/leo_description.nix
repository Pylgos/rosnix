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
  substituteSource,
  xacro,
}:
let
  sources = rec {
    leo_description = substituteSource {
      src = fetchgit {
        name = "leo_description-source";
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
  src = sources.leo_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "URDF Description package for Leo Rover";
  };
}
