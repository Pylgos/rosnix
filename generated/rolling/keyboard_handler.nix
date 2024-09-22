{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    keyboard_handler = substituteSource {
      src = fetchFromGitHub {
        name = "keyboard_handler-source";
        owner = "ros2-gbp";
        repo = "keyboard_handler-release";
        rev = "5518cbbb786b7a6d0ef4d1406544c7ac4fdf3c31";
        hash = "sha256-cM1eIpQQsH6YmfL/vj9FuQEkNSQ8xU2Cbn0Uv68rTN8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "keyboard_handler";
  version = "0.4.0-1";
  src = sources.keyboard_handler;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Handler for input from keyboard";
  };
}
