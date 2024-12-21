{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
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
  version = "6.1.0-1";
  src = finalAttrs.passthru.sources."camera_info_manager_py";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy sensor-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "camera_info_manager_py" = substituteSource {
      src = fetchgit {
        name = "camera_info_manager_py-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "b895852a082394e2c02ffd80d289106eaf1c7dc2";
        hash = "sha256-PXWbfDSXUmVa9hk8lHJhd0W4TKL3Hpl8wJS1Y1oYURk=";
      };
    };
  });
  meta = {
    description = "Python interface for camera calibration information. This ROS package provides a CameraInfo interface for Python camera drivers similar to the C++ camera_info_manager package.";
  };
})
