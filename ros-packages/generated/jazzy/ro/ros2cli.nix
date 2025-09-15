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
  version = "0.32.6-1";
  src = finalAttrs.passthru.sources."ros2cli";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" "python3-importlib-metadata" "python3-packaging" "python3-pkg-resources" "python3-psutil" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-argcomplete" "python3-importlib-metadata" "python3-packaging" "python3-pkg-resources" "python3-psutil" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2cli" = substituteSource {
      src = fetchgit {
        name = "ros2cli-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "8371ac3bf8255ea96b5172bc1a16d420a6ad8218";
        hash = "sha256-RbrpwBpr7ak07KSdpxHgYviuKTU0yp1+l5H5QZa9eA8=";
      };
    };
  });
  meta = {
    description = "\n    Framework for ROS 2 command line tools.\n  ";
  };
})
