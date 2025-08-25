{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  tf2-sensor-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "message_tf_frame_transformer";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."message_tf_frame_transformer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp sensor-msgs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp sensor-msgs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "message_tf_frame_transformer" = substituteSource {
      src = fetchgit {
        name = "message_tf_frame_transformer-source";
        url = "https://github.com/ros2-gbp/message_tf_frame_transformer-release.git";
        rev = "483ee478cd6d852fdb4fc2839047c8c0dc6022c9";
        hash = "sha256-E/pOoAS/inHYZ6ddA0bz7xZR1G+hiY5w0cpB9O21DV4=";
      };
    };
  });
  meta = {
    description = "Transforms messages of arbitrary type to a different frame using tf2::doTransform";
  };
})
