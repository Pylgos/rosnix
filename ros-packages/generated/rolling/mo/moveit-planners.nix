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
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."moveit_planners";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-planners-chomp moveit-planners-ompl moveit-planners-stomp pilz-industrial-motion-planner ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-planners-chomp moveit-planners-ompl moveit-planners-stomp pilz-industrial-motion-planner ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners" = substituteSource {
      src = fetchgit {
        name = "moveit_planners-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "f15e9a1bf37e2a6270a8ced44f17f64857140c67";
        hash = "sha256-PEjK+pDnflqqxPWgE+1/bFn7XZLf2Kioej2WHPK+94A=";
      };
    };
  });
  meta = {
    description = "Meta package that installs all available planners for MoveIt";
  };
})
