{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rclpy-message-converter-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-parser,
  rosidl-runtime-py,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rclpy_message_converter";
  version = "2.0.1-4";
  src = finalAttrs.passthru.sources."rclpy_message_converter";
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ builtin-interfaces rclpy rosidl-runtime-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 geometry-msgs rclpy-message-converter-msgs std-msgs std-srvs tf2-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rclpy_message_converter" = substituteSource {
        src = fetchgit {
          name = "rclpy_message_converter-source";
          url = "https://github.com/ros2-gbp/rospy_message_converter-release.git";
          rev = "5e7b6eadffc924bce02c147aaee115e21b564fc8";
          hash = "sha256-4HeOI1VnkkBwlxa0SlJMAGbmV5bMUIvxslRecDwZm04=";
        };
      };
    });
  };
  meta = {
    description = "Converts between Python dictionaries and JSON to rclpy messages.";
  };
})
