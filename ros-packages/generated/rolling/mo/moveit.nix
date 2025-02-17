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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-core moveit-planners moveit-plugins moveit-ros moveit-setup-assistant ];
  passthru.sources = mkSourceSet (sources: {
    "moveit" = substituteSource {
      src = fetchgit {
        name = "moveit-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0b9c036537edfafaa64994a0739dfaded22ed749";
        hash = "sha256-3KyV6T2sFlTvh99DBD3EPlrALByspyHuBZVV8TfJMT8=";
      };
    };
  });
  meta = {
    description = "Meta package that contains all essential packages of MoveIt 2";
  };
})
