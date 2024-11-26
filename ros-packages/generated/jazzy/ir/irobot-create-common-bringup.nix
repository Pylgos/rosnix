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
  buildAmentCmakePackage,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_common_bringup";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."irobot_create_common_bringup";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedBuildInputs = [ irobot-create-control irobot-create-description irobot-create-nodes joint-state-publisher robot-state-publisher ros2launch rviz2 urdf xacro ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "irobot_create_common_bringup" = substituteSource {
        src = fetchgit {
          name = "irobot_create_common_bringup-source";
          url = "https://github.com/ros2-gbp/create3_sim-release.git";
          rev = "c169debe322c1a2990f9c4381f62f8f60aa09a49";
          hash = "sha256-PsBEHEKVLQ5MpmYb4ilw4fcWEuTISMXsv46VqHoubkU=";
        };
      };
    });
  };
  meta = {
    description = "Provides common launch and configuration scripts for a simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
})
