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
  version = "5.8.2-1";
  src = finalAttrs.passthru.sources."ros2plugin";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2cli ros2pkg ];
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2plugin" = substituteSource {
      src = fetchgit {
        name = "ros2plugin-source";
        url = "https://github.com/ros2-gbp/pluginlib-release.git";
        rev = "3d3bbf829857acc881d582d423ca9d4ce238a526";
        hash = "sha256-YGgfkT/IiTEFoTDkwiD0E2KSKxbkdURy90cBkEY3FvY=";
      };
    };
  });
  meta = {
    description = "\n    The plugin command for ROS 2 command line tools.\n  ";
  };
})
