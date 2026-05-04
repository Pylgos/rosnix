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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_planners_stomp";
  version = "2.14.1-2";
  src = finalAttrs.passthru.sources."moveit_planners_stomp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ generate-parameter-library moveit-common moveit-core rsl std-msgs stomp tf2-eigen visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ generate-parameter-library moveit-common moveit-core rsl std-msgs stomp tf2-eigen visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners_stomp" = substituteSource {
      src = fetchgit {
        name = "moveit_planners_stomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "2df221860d5323d0a5e77885eae1b22bf708fd60";
        hash = "sha256-5Tr8dpk6HHRI4XitmbiVyC0ShzKe4ax2xRckayeNWOA=";
      };
    };
  });
  meta = {
    description = "STOMP Motion Planner for MoveIt";
  };
})
