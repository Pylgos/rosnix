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
  version = "0.22.0-2";
  src = finalAttrs.passthru.sources."rmw_connextdds";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rmw-connextdds-common ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_connextdds" = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "c66b73f5ee1d30f38d77a8c9ce854754bd56ff1f";
        hash = "sha256-Jrjpk82Ee3GTqvyLSRQt/mMnMAxxBxQkcV27miew8cM=";
      };
    };
  });
  meta = {
    description = "A ROS 2 RMW implementation built with RTI Connext DDS Professional.";
  };
})
