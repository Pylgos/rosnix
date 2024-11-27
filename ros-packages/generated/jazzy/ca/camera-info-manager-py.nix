{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "camera_info_manager_py";
  version = "5.1.5-1";
  src = finalAttrs.passthru.sources."camera_info_manager_py";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-rospkg" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy sensor-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "camera_info_manager_py" = substituteSource {
      src = fetchgit {
        name = "camera_info_manager_py-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "d1bf04c88ae7cabb5107089e83e7677dfbac9c10";
        hash = "sha256-21LHx0KXD2/qtA74gp+zVmeHf79szPDJQJVnLiAFzFY=";
      };
    };
  });
  meta = {
    description = "Python interface for camera calibration information. This ROS package provides a CameraInfo interface for Python camera drivers similar to the C++ camera_info_manager package.";
  };
})
