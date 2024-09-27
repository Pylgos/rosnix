{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    key_teleop-3f8d5d54af459301260c5f52b986eb16f1c21cf3 = substituteSource {
      src = fetchgit {
        name = "key_teleop-3f8d5d54af459301260c5f52b986eb16f1c21cf3-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "3f8d5d54af459301260c5f52b986eb16f1c21cf3";
        hash = "sha256-yukkmxu9PPCdLMc+IBlED7GoJdpbmKM/1HtlFOarSAc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "key_teleop";
  version = "1.5.1-1";
  src = sources.key_teleop-3f8d5d54af459301260c5f52b986eb16f1c21cf3;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "A text-based interface to send a robot movement commands.";
  };
}
