{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_control,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    irobot_create_description = substituteSource {
      src = fetchgit {
        name = "irobot_create_description-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "d24073d394dadc74a6d2903aaf0dd329326da16f";
        hash = "sha256-qnlHxrM+GZGNlhgV9CgnrR8TZPayZVpgc3okcF73zfY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_description";
  version = "3.0.2-2";
  src = sources.irobot_create_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ irobot_create_control urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_lint_cmake ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Provides the model description for the iRobot(R) Create(R) 3 Educational Robot.";
  };
}
