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
  rmw-test-fixture-implementation,
  rosSystemPackages,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2cli";
  version = "0.41.0-1";
  src = finalAttrs.passthru.sources."ros2cli";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fzf" "python3-argcomplete" "python3-packaging" "python3-psutil" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fzf" "python3-argcomplete" "python3-packaging" "python3-psutil" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint rmw-test-fixture-implementation test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2cli" = substituteSource {
      src = fetchgit {
        name = "ros2cli-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "facb4df06bbd7ea7380c22f992a5797282526532";
        hash = "sha256-ZcPzhWDU7BpIjoPTv/SCDP8nbWmgAPbQYG++ZXDLLQ4=";
      };
    };
  });
  meta = {
    description = "\n    Framework for ROS 2 command line tools.\n  ";
  };
})
