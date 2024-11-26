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
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."moveit_planners";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-planners-ompl moveit-planners-stomp pilz-industrial-motion-planner ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_planners" = substituteSource {
        src = fetchgit {
          name = "moveit_planners-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "41cef8d4768a80e8bc72058d9dbbfc4203522b10";
          hash = "sha256-pFRD3Fj/TYVY+/2jQ7DJU6qXi6aW6ojw0efFV1EGP9E=";
        };
      };
    });
  };
  meta = {
    description = "Meta package that installs all available planners for MoveIt";
  };
})
