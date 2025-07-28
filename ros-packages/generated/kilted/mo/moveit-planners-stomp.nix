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
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_planners_stomp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ generate-parameter-library moveit-common moveit-core rsl std-msgs stomp tf2-eigen visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ generate-parameter-library moveit-common moveit-core rsl std-msgs stomp tf2-eigen visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners_stomp" = substituteSource {
      src = fetchgit {
        name = "moveit_planners_stomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "7c83f2ff0213c01673889f7689f3032279dc3c8e";
        hash = "sha256-PuNSdyYt0ILLqp0Ay+Uk1qr08nzJDUiEQ09hqMPQFHc=";
      };
    };
  });
  meta = {
    description = "STOMP Motion Planner for MoveIt";
  };
})
