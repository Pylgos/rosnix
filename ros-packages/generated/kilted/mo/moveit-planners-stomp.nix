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
  version = "2.14.3-1";
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
        rev = "1bac366f8c27845a1969b50650b4916f4909d5f3";
        hash = "sha256-rDH+jDT9e9DXeGw8QAHksvNQ3JJOWxTZI8sGztn9fKg=";
      };
    };
  });
  meta = {
    description = "STOMP Motion Planner for MoveIt";
  };
})
