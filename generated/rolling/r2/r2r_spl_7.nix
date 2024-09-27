{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  splsm_7_conversion,
  substituteSource,
}:
let
  sources = rec {
    r2r_spl_7-bd2a8f4d52d998f101dfb33be38a6b6b4154ee28 = substituteSource {
      src = fetchgit {
        name = "r2r_spl_7-bd2a8f4d52d998f101dfb33be38a6b6b4154ee28-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "bd2a8f4d52d998f101dfb33be38a6b6b4154ee28";
        hash = "sha256-KqN+JK6GIZritk8/5cBigl1cu2sdMFz9nP3mrSQOsro=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "r2r_spl_7";
  version = "3.0.1-3";
  src = sources.r2r_spl_7-bd2a8f4d52d998f101dfb33be38a6b6b4154ee28;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy splsm_7_conversion ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Robot-To-Robot communication in RoboCup SPL using SPLSM V7";
  };
}
