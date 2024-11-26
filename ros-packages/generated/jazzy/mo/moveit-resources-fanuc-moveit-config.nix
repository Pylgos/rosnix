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
  version = "3.0.0-3";
  src = finalAttrs.passthru.sources."moveit_resources_fanuc_moveit_config";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher moveit-resources-fanuc-description robot-state-publisher tf2-ros xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_fanuc_moveit_config" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "c5ed7e182a3c639bab928f65b63a4497ecd359db";
        hash = "sha256-5W4dgdY+Kj2gphTOhUv2nAWi/hYFhI2zB855Sf5izOI=";
      };
    };
  });
  meta = {
    description = "";
  };
})
