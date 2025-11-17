{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-msgs,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-ros-py,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "flexbe_core";
  version = "3.0.7-1";
  src = finalAttrs.passthru.sources."flexbe_core";
  propagatedNativeBuildInputs = [ flexbe-msgs rclpy std-msgs std-srvs tf2-ros-py ];
  propagatedBuildInputs = [ flexbe-msgs rclpy std-msgs std-srvs tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-ros launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_core" = substituteSource {
      src = fetchgit {
        name = "flexbe_core-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "bd85a465298cfc4c042e6a159275b51f0e74175c";
        hash = "sha256-wjgnAwv5mUC5FtbkY+Ec8ba2aD0ZZY5m3obq3IqwS3M=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_core provides the core components for the FlexBE behavior engine.\n    ";
  };
})
