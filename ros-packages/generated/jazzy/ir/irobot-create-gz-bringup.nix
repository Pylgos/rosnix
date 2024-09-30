{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gz-ros2-control,
  irobot-create-common-bringup,
  irobot-create-description,
  irobot-create-gz-toolbox,
  irobot-create-msgs,
  mkSourceSet,
  ros-gz-bridge,
  ros-gz-interfaces,
  ros-gz-sim,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "irobot_create_gz_bringup" = substituteSource {
      src = fetchgit {
        name = "irobot_create_gz_bringup-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "95d7acda183f66171e3a24bb75c395026f5a6630";
        hash = "sha256-Sfg7l5+rnwMRG6DSEy5tGG9P20EjqhuNF/De6TeC1ps=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "irobot_create_gz_bringup";
  version = "3.0.2-2";
  src = sources."irobot_create_gz_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs gz-ros2-control irobot-create-common-bringup irobot-create-description irobot-create-gz-toolbox irobot-create-msgs ros-gz-bridge ros-gz-interfaces ros-gz-sim std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides launch and configuration scripts for a Ignition simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
}
