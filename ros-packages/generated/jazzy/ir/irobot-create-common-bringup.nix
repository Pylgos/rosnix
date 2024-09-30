{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-python,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-control,
  irobot-create-description,
  irobot-create-nodes,
  joint-state-publisher,
  mkSourceSet,
  robot-state-publisher,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "irobot_create_common_bringup" = substituteSource {
      src = fetchgit {
        name = "irobot_create_common_bringup-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "bd99fd9c0355badce636104cfd147f706cfbd38c";
        hash = "sha256-xZk2IQByXC1uVYZgWUEWuv63eg4pLo3nwj3VGpWU0Vk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "irobot_create_common_bringup";
  version = "3.0.2-2";
  src = sources."irobot_create_common_bringup";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ irobot-create-control irobot-create-description irobot-create-nodes joint-state-publisher robot-state-publisher ros2launch rviz2 urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides common launch and configuration scripts for a simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
}
