{
  ament_cmake,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_broadcaster,
  mkSourceSet,
  ros2_controllers,
  ros2launch,
  rosSystemPackages,
  rsl,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "irobot_create_control" = substituteSource {
      src = fetchgit {
        name = "irobot_create_control-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "20487f911a4a5f4f72f4f504d5688d9a306fcddf";
        hash = "sha256-IXqVo8BbiiDdcAmLFminNRK7GUjf9VjzE4oJaXmmoqs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "irobot_create_control";
  version = "3.0.2-2";
  src = sources."irobot_create_control";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joint_state_broadcaster ros2_controllers ros2launch rsl ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides the diff-drive controller for the iRobot(R) Create(R) 3 Educational Robot.";
  };
}
