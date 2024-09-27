{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy_teleop,
  key_teleop,
  rosSystemPackages,
  substituteSource,
  teleop_tools_msgs,
}:
let
  sources = rec {
    teleop_tools-064ed71017a9c2606d29e98813eb22b1a6c2ad6c = substituteSource {
      src = fetchgit {
        name = "teleop_tools-064ed71017a9c2606d29e98813eb22b1a6c2ad6c-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "064ed71017a9c2606d29e98813eb22b1a6c2ad6c";
        hash = "sha256-h2ZWLyJWFNYrxWAIvomL5wWEAfkrHGGjN0itYCTf4ag=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "teleop_tools";
  version = "1.5.1-1";
  src = sources.teleop_tools-064ed71017a9c2606d29e98813eb22b1a6c2ad6c;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joy_teleop key_teleop teleop_tools_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A set of generic teleoperation tools for any robot.";
  };
}
