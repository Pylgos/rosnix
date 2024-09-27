{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  robot_state_publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    flir_camera_description-c95f5f228611318d905943bb465df57ce9a0a6cf = substituteSource {
      src = fetchgit {
        name = "flir_camera_description-c95f5f228611318d905943bb465df57ce9a0a6cf-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "c95f5f228611318d905943bb465df57ce9a0a6cf";
        hash = "sha256-BW9xfT7JS4SQrUug5BG2EQ0c49xUa1glCNWO0Wpwk2g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flir_camera_description";
  version = "2.0.20-1";
  src = sources.flir_camera_description-c95f5f228611318d905943bb465df57ce9a0a6cf;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ robot_state_publisher urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "FLIR camera Description package";
  };
}
