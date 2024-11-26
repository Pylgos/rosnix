{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_2d_overlay_msgs";
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."rviz_2d_overlay_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_2d_overlay_msgs" = substituteSource {
      src = fetchgit {
        name = "rviz_2d_overlay_msgs-source";
        url = "https://github.com/ros2-gbp/rviz_2d_overlay_plugins-release.git";
        rev = "10d5fee30864c414dafd3390855c8bb01fd0dfca";
        hash = "sha256-5D74IzZ2A8JXaF9VzMxWd4WryX6A8MsUtaz+3ZRBFK4=";
      };
    };
  });
  meta = {
    description = "Messages describing 2D overlays for RVIZ, extracted/derived from the jsk_visualization ROS1 packege.";
  };
})
