{
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
  version = "0.36.5-1";
  src = finalAttrs.passthru.sources."tf2_ros_py";
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclpy sensor-msgs std-msgs tf2-msgs tf2-py ];
  checkInputs = [ sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "tf2_ros_py" = substituteSource {
        src = fetchgit {
          name = "tf2_ros_py-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "80b33b52c29cc4a249776e4d36f1a6af053c5093";
          hash = "sha256-iVBhmEyGt4q/neNe1qUu2K8ILrYab89Mpvemlqzw7Rw=";
        };
      };
    });
  };
  meta = {
    description = "This package contains the ROS Python bindings for the tf2 library";
  };
})
