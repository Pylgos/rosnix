{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy-teleop,
  key-teleop,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  teleop-tools-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "teleop_tools" = substituteSource {
      src = fetchgit {
        name = "teleop_tools-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "064ed71017a9c2606d29e98813eb22b1a6c2ad6c";
        hash = "sha256-h2ZWLyJWFNYrxWAIvomL5wWEAfkrHGGjN0itYCTf4ag=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "teleop_tools";
  version = "1.5.1-1";
  src = sources."teleop_tools";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joy-teleop key-teleop teleop-tools-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A set of generic teleoperation tools for any robot.";
  };
}
