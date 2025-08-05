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
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."rmw_connextdds";
  propagatedNativeBuildInputs = [ ament-cmake rmw-connextdds-common ];
  propagatedBuildInputs = [ ament-cmake rmw-connextdds-common ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_connextdds" = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "ce80dc8625f5df172b9f041ef2c38979eb258586";
        hash = "sha256-esZQDBQvU9/oQeD1xXz6nxOgVlAeIH4KCNg2W6uG6W8=";
      };
    };
  });
  meta = {
    description = "A ROS 2 RMW implementation built with RTI Connext DDS Professional.";
  };
})
