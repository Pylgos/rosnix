{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  mkSourceSet,
  moveit-resources-fanuc-description,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_fanuc_moveit_config";
  version = "3.0.0-2";
  src = finalAttrs.passthru.sources."moveit_resources_fanuc_moveit_config";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher moveit-resources-fanuc-description robot-state-publisher tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_fanuc_moveit_config" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "2f769a648d8da53a6857291a8f3a9338f78d0371";
        hash = "sha256-5W4dgdY+Kj2gphTOhUv2nAWi/hYFhI2zB855Sf5izOI=";
      };
    };
  });
  meta = {
    description = "";
  };
})
