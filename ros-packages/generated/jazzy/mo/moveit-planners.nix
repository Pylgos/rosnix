{
  ament-cmake,
  buildAmentCmakePackage,
  chomp-motion-planner,
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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_planners";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ chomp-motion-planner moveit-planners-ompl moveit-planners-stomp pilz-industrial-motion-planner ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners" = substituteSource {
      src = fetchgit {
        name = "moveit_planners-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0f09bdcf77ac31ea6bfd5e34d258bd3f892c61e7";
        hash = "sha256-s8GGEm/iMmQbzBJ1oaMekdfIXx9dM/xuNEKhoA58Mmc=";
      };
    };
  });
  meta = {
    description = "Meta package that installs all available planners for MoveIt";
  };
})
