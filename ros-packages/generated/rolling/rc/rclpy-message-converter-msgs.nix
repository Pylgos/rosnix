{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclpy_message_converter_msgs";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."rclpy_message_converter_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators ];
  passthru.sources = mkSourceSet (sources: {
    "rclpy_message_converter_msgs" = substituteSource {
      src = fetchgit {
        name = "rclpy_message_converter_msgs-source";
        url = "https://github.com/ros2-gbp/rospy_message_converter-release.git";
        rev = "62f2fd348e57474a9695e76a0a5c462b6e6d1357";
        hash = "sha256-p/kxXngXBBgZ4f7MVpWP3clFk+ZLssUxqLlDiRGvh40=";
      };
    };
  });
  meta = {
    description = "Messages for rclpy_message_converter";
  };
})
