{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2cli";
  version = "0.39.2-1";
  src = finalAttrs.passthru.sources."ros2cli";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" "python3-importlib-metadata" "python3-packaging" "python3-psutil" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-argcomplete" "python3-importlib-metadata" "python3-packaging" "python3-psutil" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2cli" = substituteSource {
      src = fetchgit {
        name = "ros2cli-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "5a904898cbf31a80fcaf87da75814daf81620eb9";
        hash = "sha256-UbhXFV/nmASWzhlsYJdbWIEGfNId0jTP2XZ1ddb5CWg=";
      };
    };
  });
  meta = {
    description = "\n    Framework for ROS 2 command line tools.\n  ";
  };
})
