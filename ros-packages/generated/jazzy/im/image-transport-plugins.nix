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
  version = "4.0.3-1";
  src = finalAttrs.passthru.sources."image_transport_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ compressed-depth-image-transport compressed-image-transport theora-image-transport zstd-image-transport ];
  passthru = {
    sources = mkSourceSet (sources: {
      "image_transport_plugins" = substituteSource {
        src = fetchgit {
          name = "image_transport_plugins-source";
          url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
          rev = "ac379175e5e81a5801b7c4e26fa67cdd214cb4f0";
          hash = "sha256-eWfgH42ODnKGvZY5xrBOC+B2NZdFFOhs5AZTIrKIxjw=";
        };
      };
    });
  };
  meta = {
    description = "A set of plugins for publishing and subscribing to sensor_msgs/Image topics in representations other than raw pixel data. For example, for viewing a stream of images off-robot, a video codec will give much lower bandwidth and latency. For low frame rate tranport of high-definition images, you might prefer sending them as JPEG or PNG-compressed form.";
  };
})
