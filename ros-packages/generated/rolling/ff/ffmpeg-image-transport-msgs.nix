{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "ffmpeg_image_transport_msgs";
  version = "1.0.2-2";
  src = finalAttrs.passthru.sources."ffmpeg_image_transport_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ffmpeg_image_transport_msgs" = substituteSource {
        src = fetchgit {
          name = "ffmpeg_image_transport_msgs-source";
          url = "https://github.com/ros2-gbp/ffmpeg_image_transport_msgs-release.git";
          rev = "b085e3765bada63bf8b77222d6587dd5632b7537";
          hash = "sha256-pqSfqQqwy2iI4Z76hMWtAkpmjCYHy0xa0SBqsE+X/dQ=";
        };
      };
    });
  };
  meta = {
    description = "messages for ffmpeg image transport plugin";
  };
})
