{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  joy_linux,
  rosSystemPackages,
  substituteSource,
  teleop_twist_joy,
  teleop_twist_keyboard,
}:
let
  sources = rec {
    leo_teleop = substituteSource {
      src = fetchFromGitHub {
        name = "leo_teleop-source";
        owner = "ros2-gbp";
        repo = "leo_common-release";
        rev = "62b99f851ab3d7a86d2687981077d7fd3ca5eeb5";
        hash = "sha256-JeNimAF404UWrQOSZAjVQxl5ntBZtCKMBiq6oUssPTo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_teleop";
  version = "3.0.3-1";
  src = sources.leo_teleop;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joy_linux teleop_twist_joy teleop_twist_keyboard ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Scripts and launch files for Leo Rover teleoperation";
  };
}
