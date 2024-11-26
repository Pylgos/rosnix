{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  ros-environment,
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
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."message_tf_frame_transformer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ geometry-msgs rclcpp sensor-msgs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "message_tf_frame_transformer" = substituteSource {
      src = fetchgit {
        name = "message_tf_frame_transformer-source";
        url = "https://github.com/ros2-gbp/message_tf_frame_transformer-release.git";
        rev = "8365d8e62c09180ae085e4e225e5f2fb90d0439b";
        hash = "sha256-lYSUvKIMjeyVNRJsf7Qj8XGausPw6UVLCKmHL7D1St8=";
      };
    };
  });
  meta = {
    description = "Transforms messages of arbitrary type to a different frame using tf2::doTransform";
  };
})
