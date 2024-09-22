{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  joint_trajectory_controller,
  picknik_reset_fault_controller,
  picknik_twist_controller,
  robot_state_publisher,
  robotiq_description,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    kortex_description = substituteSource {
      src = fetchFromGitHub {
        name = "kortex_description-source";
        owner = "ros2-gbp";
        repo = "ros2_kortex-release";
        rev = "819182cb6c4933cae39cd85e078838b614ec5ea6";
        hash = "sha256-eH7UKiSAo+QFISA/cyGSkHrLrr4LNrQRNQJoNIQrK8M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kortex_description";
  version = "0.2.2-2";
  src = sources.kortex_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui joint_trajectory_controller picknik_reset_fault_controller picknik_twist_controller robot_state_publisher robotiq_description rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "";
  };
}
