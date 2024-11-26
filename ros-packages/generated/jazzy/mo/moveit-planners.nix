{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-planners-ompl,
  moveit-planners-stomp,
  pilz-industrial-motion-planner,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_planners";
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_planners";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-planners-ompl moveit-planners-stomp pilz-industrial-motion-planner ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_planners" = substituteSource {
        src = fetchgit {
          name = "moveit_planners-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "52849597ee1e7579bd26f4d857e96fd813815e1e";
          hash = "sha256-tHhEg3jwekHAsyucoYE+gFnMw+bCXkrKzo++Lkpf0So=";
        };
      };
    });
  };
  meta = {
    description = "Meta package that installs all available planners for MoveIt";
  };
})
