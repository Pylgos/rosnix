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
  version = "0.1.2-1";
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
        rev = "09d89f6784451e038b0152b5eb524a8aae8a4a2a";
        hash = "sha256-jtiWZx5nc9HQU2LsuIbS1Ndl3mh+T5WMWe08u7C4Xj8=";
      };
    };
  });
  meta = {
    description = "Track poses via periodic tf lookups.";
  };
})
