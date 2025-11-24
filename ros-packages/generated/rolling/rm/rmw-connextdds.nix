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
  version = "1.2.4-1";
  src = finalAttrs.passthru.sources."rmw_connextdds";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rmw-connextdds-common ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rmw-connextdds-common ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_connextdds" = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "2ce23910891ab75525b2a4314f5f0cd49b51d4d6";
        hash = "sha256-vD8OiciOWq5SDuqlwauzu8fn0h71kzyU3NACJESUV1E=";
      };
    };
  });
  meta = {
    description = "A ROS 2 RMW implementation built with RTI Connext DDS Professional.";
  };
})
