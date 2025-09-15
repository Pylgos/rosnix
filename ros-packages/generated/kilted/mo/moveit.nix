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
  version = "2.14.1-1";
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
        rev = "faa1960a885b0f4cdf9a985379af29688f8077ca";
        hash = "sha256-Jq2GheQwC0dModkkL562uZg5HgUDBWktvDKHEMQIBmw=";
      };
    };
  });
  meta = {
    description = "Meta package that contains all essential packages of MoveIt 2";
  };
})
