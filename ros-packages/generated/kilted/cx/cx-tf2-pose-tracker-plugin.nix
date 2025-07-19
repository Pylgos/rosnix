{
  ament-cmake,
  buildAmentCmakePackage,
  clips-vendor,
  cx-plugin,
  cx-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_tf2_pose_tracker_plugin";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."cx_tf2_pose_tracker_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clips-vendor cx-plugin cx-utils geometry-msgs pluginlib tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clips-vendor cx-plugin cx-utils geometry-msgs pluginlib tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "cx_tf2_pose_tracker_plugin" = substituteSource {
      src = fetchgit {
        name = "cx_tf2_pose_tracker_plugin-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "18d3f9eb01edb3afa88a1279e753decce6f78b0b";
        hash = "sha256-+Uda8Dx3Tqegv48DLctbgCba6ELiCZwwLXvVeGSg3JE=";
      };
    };
  });
  meta = {
    description = "Track poses via periodic tf lookups.";
  };
})
