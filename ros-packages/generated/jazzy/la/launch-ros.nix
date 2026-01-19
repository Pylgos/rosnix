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
  version = "0.26.11-1";
  src = finalAttrs.passthru.sources."launch_ros";
  propagatedNativeBuildInputs = [ ament-index-python composition-interfaces launch lifecycle-msgs osrf-pycommon rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python composition-interfaces launch lifecycle-msgs osrf-pycommon rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_ros" = substituteSource {
      src = fetchgit {
        name = "launch_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "4c785bba9605a136f5b60821a91b464926946e7b";
        hash = "sha256-l6Sl9b6ZtbVM33KTZQEpOVDWt/jHOVucc0TbvgoWWaE=";
      };
    };
  });
  meta = {
    description = "ROS specific extensions to the launch tool.";
  };
})
