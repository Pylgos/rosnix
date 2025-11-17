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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."rviz_2d_overlay_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_2d_overlay_msgs" = substituteSource {
      src = fetchgit {
        name = "rviz_2d_overlay_msgs-source";
        url = "https://github.com/ros2-gbp/rviz_2d_overlay_plugins-release.git";
        rev = "dacf1fc9d5702ca58ff4eebd0c5c78ea0c1a2ef2";
        hash = "sha256-f0NpaFJktV5hCV4C+U5O3eNIV/GWJfA72gyZFfFf1LQ=";
      };
    };
  });
  meta = {
    description = "Messages describing 2D overlays for RVIZ, extracted/derived from the jsk_visualization ROS1 packege.\n    ";
  };
})
