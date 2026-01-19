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
  osrf-pycommon,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_ros";
  version = "0.28.5-1";
  src = finalAttrs.passthru.sources."launch_ros";
  propagatedNativeBuildInputs = [ ament-index-python composition-interfaces launch lifecycle-msgs osrf-pycommon rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python composition-interfaces launch lifecycle-msgs osrf-pycommon rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_ros" = substituteSource {
      src = fetchgit {
        name = "launch_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "0d9a8d61595921757c5f39b247c38f26a32553bc";
        hash = "sha256-aoUbpRy+48MNmAJEZuHXrOTumKjAnI3ukxlAhXB0+IU=";
      };
    };
  });
  meta = {
    description = "ROS specific extensions to the launch tool.";
  };
})
