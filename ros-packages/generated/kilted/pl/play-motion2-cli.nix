{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  play-motion2,
  rclpy,
  ros2cli,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "play_motion2_cli";
  version = "1.8.3-1";
  src = finalAttrs.passthru.sources."play_motion2_cli";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ play-motion2 rclpy ros2cli ];
  propagatedBuildInputs = [ play-motion2 rclpy ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "play_motion2_cli" = substituteSource {
      src = fetchgit {
        name = "play_motion2_cli-source";
        url = "https://github.com/ros2-gbp/play_motion2-release.git";
        rev = "1ed65a390cf7b7a338a7c29e499d5365a4ed7bbb";
        hash = "sha256-TOdF7zNMfaoItUSI9MTxlMk2UbY8xC3XZibN+lheArk=";
      };
    };
  });
  meta = {
    description = "\n    The play_motion command for ROS 2 command line tools.\n  ";
  };
})
