{
  ament-cmake,
  buildAmentCmakePackage,
  cx-ament-index-plugin,
  cx-bringup,
  cx-clips-env-manager,
  cx-config-plugin,
  cx-example-plugin,
  cx-executive-plugin,
  cx-file-load-plugin,
  cx-msgs,
  cx-plugin,
  cx-protobuf-plugin,
  cx-ros-comm-gen,
  cx-ros-msgs-plugin,
  cx-tf2-pose-tracker-plugin,
  cx-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clips_executive";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."clips_executive";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cx-ament-index-plugin cx-bringup cx-clips-env-manager cx-config-plugin cx-example-plugin cx-executive-plugin cx-file-load-plugin cx-msgs cx-plugin cx-protobuf-plugin cx-ros-comm-gen cx-ros-msgs-plugin cx-tf2-pose-tracker-plugin cx-utils ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cx-ament-index-plugin cx-bringup cx-clips-env-manager cx-config-plugin cx-example-plugin cx-executive-plugin cx-file-load-plugin cx-msgs cx-plugin cx-protobuf-plugin cx-ros-comm-gen cx-ros-msgs-plugin cx-tf2-pose-tracker-plugin cx-utils ];
  passthru.sources = mkSourceSet (sources: {
    "clips_executive" = substituteSource {
      src = fetchgit {
        name = "clips_executive-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "4474286fcb4acd89683577f481a2941c3496acca";
        hash = "sha256-Iwa1Ejf0j6BgC2Feorj8DGdDeEnx/We5SbHBUGHQ1DE=";
      };
    };
  });
  meta = {
    description = "ROS2 CLIPS-Executive meta package and documentation";
  };
})
