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
  version = "0.42.2-1";
  src = finalAttrs.passthru.sources."tf2_ros_py";
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclpy sensor-msgs std-msgs tf2-msgs tf2-py ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclpy sensor-msgs std-msgs tf2-msgs tf2-py ];
  checkInputs = [ ament-xmllint sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tf2_ros_py" = substituteSource {
      src = fetchgit {
        name = "tf2_ros_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "8f36b675d3deef940732e9778a0d33b527cb9f8b";
        hash = "sha256-tlpafYJJdOFPPQvg5ZItP3gDN3Yp0TSg8V/454ZeXC4=";
      };
    };
  });
  meta = {
    description = "\n    This package contains the ROS Python bindings for the tf2 library\n  ";
  };
})
