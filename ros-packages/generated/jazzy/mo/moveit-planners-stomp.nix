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
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."moveit_planners_stomp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ generate-parameter-library moveit-common moveit-core rsl std-msgs stomp tf2-eigen visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners_stomp" = substituteSource {
      src = fetchgit {
        name = "moveit_planners_stomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "f1d22a61f2482b29189f9566c375e8cfc656624e";
        hash = "sha256-DqwB1HX5A8eQOs3vAfBEOOm+wdchjR6FU8a+TV/k4XA=";
      };
    };
  });
  meta = {
    description = "STOMP Motion Planner for MoveIt";
  };
})
