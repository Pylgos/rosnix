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
  version = "6.2.2-1";
  src = finalAttrs.passthru.sources."camera_info_manager_py";
  propagatedNativeBuildInputs = [ ament-index-python rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "camera_info_manager_py" = substituteSource {
      src = fetchgit {
        name = "camera_info_manager_py-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "5051051cd3729a570d023be86a099bafc36a9a1c";
        hash = "sha256-HfXOpfp2Jx5+83u/PUneFCfR3pwlFluqkQhuM6uRv9Y=";
      };
    };
  });
  meta = {
    description = "\n    Python interface for camera calibration information.\n\n    This ROS package provides a CameraInfo interface for Python camera\n    drivers similar to the C++ camera_info_manager package.\n  ";
  };
})
