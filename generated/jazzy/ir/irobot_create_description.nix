{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_control,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    irobot_create_description-d24073d394dadc74a6d2903aaf0dd329326da16f = substituteSource {
      src = fetchgit {
        name = "irobot_create_description-d24073d394dadc74a6d2903aaf0dd329326da16f-source";
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
  src = sources.irobot_create_description-d24073d394dadc74a6d2903aaf0dd329326da16f;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ irobot_create_control urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_lint_cmake ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides the model description for the iRobot(R) Create(R) 3 Educational Robot.";
  };
}
