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
  version = "0.40.6-2";
  src = finalAttrs.passthru.sources."ros2cli";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fzf" "python3-argcomplete" "python3-packaging" "python3-psutil" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fzf" "python3-argcomplete" "python3-packaging" "python3-psutil" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint rmw-test-fixture-implementation test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2cli" = substituteSource {
      src = fetchgit {
        name = "ros2cli-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "3b3ab47af05af43a7b2270f062438a81d90fa6b6";
        hash = "sha256-b3Uf3+B5+moRPv9YRgkWVO/o9Cb+bkoL1V4MZ3h0zV4=";
      };
    };
  });
  meta = {
    description = "\n    Framework for ROS 2 command line tools.\n  ";
  };
})
