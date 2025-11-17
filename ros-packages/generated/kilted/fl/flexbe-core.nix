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
  version = "4.0.2-1";
  src = finalAttrs.passthru.sources."flexbe_core";
  propagatedNativeBuildInputs = [ flexbe-msgs rclpy std-msgs std-srvs tf2-ros-py ];
  propagatedBuildInputs = [ flexbe-msgs rclpy std-msgs std-srvs tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-ros launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_core" = substituteSource {
      src = fetchgit {
        name = "flexbe_core-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "99b8882408488c62cfc40bb0444c4196b1a26334";
        hash = "sha256-4Ii4m+q1avv8EnQrLpeQcZRJdHl2jxh4f0IihPolPnI=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_core provides the core components for the FlexBE behavior engine.\n    ";
  };
})
