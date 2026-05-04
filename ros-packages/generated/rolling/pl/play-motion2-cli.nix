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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "play_motion2_cli";
  version = "1.8.4-2";
  src = finalAttrs.passthru.sources."play_motion2_cli";
  propagatedNativeBuildInputs = [ play-motion2 rclpy ros2cli ];
  propagatedBuildInputs = [ play-motion2 rclpy ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "play_motion2_cli" = substituteSource {
      src = fetchgit {
        name = "play_motion2_cli-source";
        url = "https://github.com/ros2-gbp/play_motion2-release.git";
        rev = "f421588c6b92d1a5ec8ac4b5b9ed2234d84b06fe";
        hash = "sha256-D92xAW/8jxSut9Mj/TSBpyAeyUibk7BG0J4KrdVlMPs=";
      };
    };
  });
  meta = {
    description = "\n    The play_motion command for ROS 2 command line tools.\n  ";
  };
})
