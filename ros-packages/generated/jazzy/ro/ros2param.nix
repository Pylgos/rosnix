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
  rcl-interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2service,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2param";
  version = "0.32.4-1";
  src = finalAttrs.passthru.sources."ros2param";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ rcl-interfaces ros2cli ros2node ros2service ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2param" = substituteSource {
      src = fetchgit {
        name = "ros2param-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "5b5b450ae0979eb3b81a82e00b5e4242a2b7bade";
        hash = "sha256-EDDePPg/L0yrQP2gWIC+856zaaq7vbnZpghIfYHEedE=";
      };
    };
  });
  meta = {
    description = "The param command for ROS 2 command line tools.";
  };
})
