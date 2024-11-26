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
  version = "0.28.0-1";
  src = finalAttrs.passthru.sources."launch_ros";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python composition-interfaces launch lifecycle-msgs osrf-pycommon rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "launch_ros" = substituteSource {
        src = fetchgit {
          name = "launch_ros-source";
          url = "https://github.com/ros2-gbp/launch_ros-release.git";
          rev = "73c8a10057b1ae5f5d383e6c0c7fe0d6b0011e34";
          hash = "sha256-W4DGYXwb9pfHCpO7VQciMNBqZtD3NBs/ZPPu+a7zYG8=";
        };
      };
    });
  };
  meta = {
    description = "ROS specific extensions to the launch tool.";
  };
})
