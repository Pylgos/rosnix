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
  version = "1.2.3-1";
  src = finalAttrs.passthru.sources."rmw_connextdds";
  propagatedNativeBuildInputs = [ ament-cmake rmw-connextdds-common ];
  propagatedBuildInputs = [ ament-cmake rmw-connextdds-common ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_connextdds" = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "9140d2219d750abaa7757dfa1dd1f9b173b62a61";
        hash = "sha256-i0OWs6A0wxh7xx9dThtjA+kq/ZcV/Iz30mKRTyt+VLA=";
      };
    };
  });
  meta = {
    description = "A ROS 2 RMW implementation built with RTI Connext DDS Professional.";
  };
})
