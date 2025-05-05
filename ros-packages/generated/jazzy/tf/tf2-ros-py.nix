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
  version = "0.36.10-1";
  src = finalAttrs.passthru.sources."tf2_ros_py";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs sensor-msgs std-msgs tf2-msgs tf2-py ];
  checkInputs = [ sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tf2_ros_py" = substituteSource {
      src = fetchgit {
        name = "tf2_ros_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "6881265f44f40857837267d04546db8fbb24ee26";
        hash = "sha256-SITX5dk3d/DXXgOQxsUvyfnITrqBEt/v0bVeuQWnSgQ=";
      };
    };
  });
  meta = {
    description = "This package contains the ROS Python bindings for the tf2 library";
  };
})
