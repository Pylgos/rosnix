{
  ament-cmake,
  buildAmentCmakePackage,
  compressed-depth-image-transport,
  compressed-image-transport,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  theora-image-transport,
  zstd-image-transport,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_transport_plugins";
  version = "5.0.2-1";
  src = finalAttrs.passthru.sources."image_transport_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ compressed-depth-image-transport compressed-image-transport theora-image-transport zstd-image-transport ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ compressed-depth-image-transport compressed-image-transport theora-image-transport zstd-image-transport ];
  passthru.sources = mkSourceSet (sources: {
    "image_transport_plugins" = substituteSource {
      src = fetchgit {
        name = "image_transport_plugins-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "bff001d2f8ef6395eccafeb24c45085fcd20813a";
        hash = "sha256-O/g8Nlbx5uW839V6Ez53/mZiMXYFMqjtL7B0M5vBXEM=";
      };
    };
  });
  meta = {
    description = "\n    A set of plugins for publishing and subscribing to sensor_msgs/Image topics\n    in representations other than raw pixel data. For example, for viewing a\n    stream of images off-robot, a video codec will give much lower bandwidth\n    and latency. For low frame rate tranport of high-definition images, you\n    might prefer sending them as JPEG or PNG-compressed form.\n  ";
  };
})
