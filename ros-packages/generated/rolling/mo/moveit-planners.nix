{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-planners-chomp,
  moveit-planners-ompl,
  moveit-planners-stomp,
  pilz-industrial-motion-planner,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_planners";
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_planners";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-planners-chomp moveit-planners-ompl moveit-planners-stomp pilz-industrial-motion-planner ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners" = substituteSource {
      src = fetchgit {
        name = "moveit_planners-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "89e40c1bd24f7f3e0bb815900a7bc77eadf5ae3e";
        hash = "sha256-34KuBbwI6cg0mucFin2+oXt273c9fkTxvdWJT7Ny9U8=";
      };
    };
  });
  meta = {
    description = "Meta package that installs all available planners for MoveIt";
  };
})
