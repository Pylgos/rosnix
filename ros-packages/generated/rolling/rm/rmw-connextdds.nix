{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmw-connextdds-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_connextdds";
  version = "0.24.2-1";
  src = finalAttrs.passthru.sources."rmw_connextdds";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rmw-connextdds-common ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmw_connextdds" = substituteSource {
        src = fetchgit {
          name = "rmw_connextdds-source";
          url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
          rev = "b514e05528db34aefeab94a06206909f0c35ba2d";
          hash = "sha256-RonsufmhaFyS97FFx1Jmv4cdVyS1X4V6JV87dD4iSbY=";
        };
      };
    });
  };
  meta = {
    description = "A ROS 2 RMW implementation built with RTI Connext DDS Professional.";
  };
})
