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
  buildAmentCmakePackage,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_gz_bringup";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."irobot_create_gz_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ geometry-msgs gz-ros2-control irobot-create-common-bringup irobot-create-description irobot-create-gz-toolbox irobot-create-msgs ros-gz-bridge ros-gz-interfaces ros-gz-sim std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "irobot_create_gz_bringup" = substituteSource {
        src = fetchgit {
          name = "irobot_create_gz_bringup-source";
          url = "https://github.com/ros2-gbp/create3_sim-release.git";
          rev = "ca60bbe4b595e2272221d078541b4b02a0a79574";
          hash = "sha256-yOUUrTXwggeC/Yugd3b8JRGcNZPrpmHW7cdWyog58FA=";
        };
      };
    });
  };
  meta = {
    description = "Provides launch and configuration scripts for a Ignition simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
})
