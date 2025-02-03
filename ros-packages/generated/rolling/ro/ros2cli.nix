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
  version = "0.37.0-1";
  src = finalAttrs.passthru.sources."ros2cli";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" "python3-importlib-metadata" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-packaging" "python3-psutil" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2cli" = substituteSource {
      src = fetchgit {
        name = "ros2cli-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "8c638665d81cad89efa5777aa011d2d8cce12c5d";
        hash = "sha256-5U2ZtUjPMwPDf80UXaEYqwFAei0eTeIk0BfZxEYkbuQ=";
      };
    };
  });
  meta = {
    description = "Framework for ROS 2 command line tools.";
  };
})
