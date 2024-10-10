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
let
  sources = mkSourceSet (sources: {
    "rclpy_message_converter" = substituteSource {
      src = fetchgit {
        name = "rclpy_message_converter-source";
        url = "https://github.com/ros2-gbp/rospy_message_converter-release.git";
        rev = "5587c3cd28283f952dafc544143aef02f38532fc";
        hash = "sha256-DCqqMbmIIzPN9jyxeYneVEa6gg9iyDFuE/X1iv9EYPk=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "rclpy_message_converter";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."rclpy_message_converter";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces rclpy rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 geometry-msgs rclpy-message-converter-msgs std-msgs std-srvs tf2-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Converts between Python dictionaries and JSON to rclpy messages.";
  };
})
