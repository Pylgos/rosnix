{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-gui-vendor,
  mkSourceSet,
  ros-gz,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_gz_plugins";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."irobot_create_gz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ gz-gui-vendor ros-gz ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-xmllint ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "irobot_create_gz_plugins" = substituteSource {
        src = fetchgit {
          name = "irobot_create_gz_plugins-source";
          url = "https://github.com/ros2-gbp/create3_sim-release.git";
          rev = "dfc61660e72eed57425e326450ad75d04be9b696";
          hash = "sha256-e7lnx2hugBAcfjhx4TQ95s/rvscaEf77Hw959O67lPU=";
        };
      };
    });
  };
  meta = {
    description = "Ignition plugins for simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
})
