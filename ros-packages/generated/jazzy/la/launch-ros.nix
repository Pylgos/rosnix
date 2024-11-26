{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
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
  version = "0.26.5-2";
  src = finalAttrs.passthru.sources."launch_ros";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python composition-interfaces launch lifecycle-msgs osrf-pycommon rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "launch_ros" = substituteSource {
        src = fetchgit {
          name = "launch_ros-source";
          url = "https://github.com/ros2-gbp/launch_ros-release.git";
          rev = "614dac856387c97632678b01252b0de112f1a346";
          hash = "sha256-cV925fWAMrUPzECwVRsuI+lqITsE2hoUUK+5X0gGpik=";
        };
      };
    });
  };
  meta = {
    description = "ROS specific extensions to the launch tool.";
  };
})
