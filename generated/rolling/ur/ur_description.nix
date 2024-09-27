{
  ament_cmake,
  ament_cmake_pytest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher_gui,
  launch,
  launch_ros,
  launch_testing_ament_cmake,
  launch_testing_ros,
  robot_state_publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    ur_description-7194c201d71aeb030acd1c6f1e0905689294ebd4 = substituteSource {
      src = fetchgit {
        name = "ur_description-7194c201d71aeb030acd1c6f1e0905689294ebd4-source";
        url = "https://github.com/ros2-gbp/ur_description-release.git";
        rev = "7194c201d71aeb030acd1c6f1e0905689294ebd4";
        hash = "sha256-MG7vbOrCS9hiqah2946KSpRaeUFDNuiKjvdxaPVjVOo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_description";
  version = "2.4.3-1";
  src = sources.ur_description-7194c201d71aeb030acd1c6f1e0905689294ebd4;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joint_state_publisher_gui launch launch_ros robot_state_publisher rviz2 urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest launch_testing_ament_cmake launch_testing_ros xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-tools" ]; };
  meta = {
    description = "URDF description for Universal Robots";
  };
}
