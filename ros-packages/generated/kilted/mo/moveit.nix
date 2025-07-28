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
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-core moveit-planners moveit-plugins moveit-ros moveit-setup-assistant ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-core moveit-planners moveit-plugins moveit-ros moveit-setup-assistant ];
  passthru.sources = mkSourceSet (sources: {
    "moveit" = substituteSource {
      src = fetchgit {
        name = "moveit-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "d441021889c68c1a70982c4df902ae768242d80c";
        hash = "sha256-XxqOestUHy7qWSyXJMM+UVGXx0uLX5NQZT3VuiX5SL4=";
      };
    };
  });
  meta = {
    description = "Meta package that contains all essential packages of MoveIt 2";
  };
})
