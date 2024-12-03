{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-core,
  moveit-planners,
  moveit-plugins,
  moveit-ros,
  moveit-setup-assistant,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-core moveit-planners moveit-plugins moveit-ros moveit-setup-assistant ];
  passthru.sources = mkSourceSet (sources: {
    "moveit" = substituteSource {
      src = fetchgit {
        name = "moveit-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "bb0420ef17b47d3378946d514dfceee3d6d08dbb";
        hash = "sha256-it0Mpp7JGOUT7cDNMqbGn7kxcA/5d1eVZZ/DvquQbMo=";
      };
    };
  });
  meta = {
    description = "Meta package that contains all essential packages of MoveIt 2";
  };
})
