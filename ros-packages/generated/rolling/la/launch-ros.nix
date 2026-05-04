{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  composition-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  lifecycle-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_ros";
  version = "0.29.7-2";
  src = finalAttrs.passthru.sources."launch_ros";
  propagatedNativeBuildInputs = [ ament-index-python composition-interfaces launch lifecycle-msgs rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-osrf-pycommon" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python composition-interfaces launch lifecycle-msgs rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-osrf-pycommon" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_ros" = substituteSource {
      src = fetchgit {
        name = "launch_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "dec60be0f2bfecfd40ee859282b93fa3f0521333";
        hash = "sha256-9J1Z/VKE6I960mQNW10mOOz1lileWfkYWdNzM9G5OUE=";
      };
    };
  });
  meta = {
    description = "ROS specific extensions to the launch tool.";
  };
})
