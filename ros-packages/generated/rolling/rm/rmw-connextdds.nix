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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."rmw_connextdds";
  propagatedNativeBuildInputs = [ ament-cmake rmw-connextdds-common ];
  propagatedBuildInputs = [ ament-cmake rmw-connextdds-common ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_connextdds" = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "65c4438c4271d5a84393f1f9bfd528871a1b45ba";
        hash = "sha256-raI1gkABXPexpgyEcJ/VH9m1U5GAhM+MR/jTA6DKAVw=";
      };
    };
  });
  meta = {
    description = "A ROS 2 RMW implementation built with RTI Connext DDS Professional.";
  };
})
