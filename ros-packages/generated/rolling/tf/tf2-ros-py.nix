{
  ament-xmllint,
  buildAmentPythonPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-msgs,
  tf2-py,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tf2_ros_py";
  version = "0.40.0-1";
  src = finalAttrs.passthru.sources."tf2_ros_py";
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclpy sensor-msgs std-msgs tf2-msgs tf2-py ];
  checkInputs = [ ament-xmllint sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tf2_ros_py" = substituteSource {
      src = fetchgit {
        name = "tf2_ros_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "746b72a245902fe034cf20193cb1ad739b8f2722";
        hash = "sha256-KyVJgoSQKN7i+rnCTXYl0dyigkbWZ3CKoaTzZoeNVYY=";
      };
    };
  });
  meta = {
    description = "This package contains the ROS Python bindings for the tf2 library";
  };
})
