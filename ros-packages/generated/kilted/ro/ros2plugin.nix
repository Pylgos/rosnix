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
  ros2cli,
  ros2pkg,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2plugin";
  version = "5.6.3-1";
  src = finalAttrs.passthru.sources."ros2plugin";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2cli ros2pkg ];
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2plugin" = substituteSource {
      src = fetchgit {
        name = "ros2plugin-source";
        url = "https://github.com/ros2-gbp/pluginlib-release.git";
        rev = "f2a75d1f2b1fed844dd35ccd0ea5f0ae2f2f1f10";
        hash = "sha256-remC42XlztmBIAVSNEELUldNM78PWy2hH83RJlFz1Wo=";
      };
    };
  });
  meta = {
    description = "\n    The plugin command for ROS 2 command line tools.\n  ";
  };
})
