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
  version = "1.1.2-1";
  src = finalAttrs.passthru.sources."message_tf_frame_transformer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp ros-environment sensor-msgs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp ros-environment sensor-msgs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "message_tf_frame_transformer" = substituteSource {
      src = fetchgit {
        name = "message_tf_frame_transformer-source";
        url = "https://github.com/ros2-gbp/message_tf_frame_transformer-release.git";
        rev = "bfe9a7f73c48565396efa8f1fa0e0b927a903b07";
        hash = "sha256-vWCcNT8fLXTKeJfhSDyA/wyHJjnuC3gX+U4gtEZXfCA=";
      };
    };
  });
  meta = {
    description = "Transforms messages of arbitrary type to a different frame using tf2::doTransform";
  };
})
