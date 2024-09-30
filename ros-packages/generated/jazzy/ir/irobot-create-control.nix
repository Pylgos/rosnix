{
  ament-cmake,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  mkSourceSet,
  ros2-controllers,
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
  pname = "irobot-create-control";
  version = "3.0.2-2";
  src = sources."irobot_create_control";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joint-state-broadcaster ros2-controllers ros2launch rsl ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides the diff-drive controller for the iRobot(R) Create(R) 3 Educational Robot.";
  };
}