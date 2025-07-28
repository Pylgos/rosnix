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
  version = "6.1.0-1";
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
        rev = "3e388dd5509984d4353f07016e0675e0d93447de";
        hash = "sha256-/z3yx54C3hZiDYEmC150h4tTLw/ZP02BpfZxPJqhoHs=";
      };
    };
  });
  meta = {
    description = "\n    A set of plugins for publishing and subscribing to sensor_msgs/Image topics\n    in representations other than raw pixel data. For example, for viewing a\n    stream of images off-robot, a video codec will give much lower bandwidth\n    and latency. For low frame rate tranport of high-definition images, you\n    might prefer sending them as JPEG or PNG-compressed form.\n  ";
  };
})
