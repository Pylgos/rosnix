{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  moveit-common,
  moveit-core,
  rosSystemPackages,
  rsl,
  std-msgs,
  stomp,
  substituteSource,
  tf2-eigen,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_planners_stomp";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_planners_stomp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ generate-parameter-library moveit-common moveit-core rsl std-msgs stomp tf2-eigen visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners_stomp" = substituteSource {
      src = fetchgit {
        name = "moveit_planners_stomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "cdf5ae23920831771bda6321ce2b6da921f57847";
        hash = "sha256-rsGc5TDOM4X7GWX1hLaCmsEWTwwgV6F4LsXE7IdcCdw=";
      };
    };
  });
  meta = {
    description = "STOMP Motion Planner for MoveIt";
  };
})
