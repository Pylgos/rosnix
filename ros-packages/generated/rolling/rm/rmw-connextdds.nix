{
  ament-cmake,
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
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."rmw_connextdds";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rmw-connextdds-common ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_connextdds" = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "cbb1a70ae18e5f39304abc5571ecfec3e981124d";
        hash = "sha256-lsK+omYNgc/xrtgCL7lhamyYDy7gUxKFDEqxufMygKM=";
      };
    };
  });
  meta = {
    description = "A ROS 2 RMW implementation built with RTI Connext DDS Professional.";
  };
})
