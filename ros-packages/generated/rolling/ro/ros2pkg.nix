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
  launch,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  ros2cli,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2pkg";
  version = "0.40.4-1";
  src = finalAttrs.passthru.sources."ros2pkg";
  propagatedNativeBuildInputs = [ ament-copyright ament-index-python ros2cli ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" "python3-empy" ]; };
  propagatedBuildInputs = [ ament-copyright ament-index-python ros2cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg-modules" "python3-empy" ]; };
  checkInputs = [ ament-flake8 ament-pep257 ament-xmllint launch launch-testing launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2pkg" = substituteSource {
      src = fetchgit {
        name = "ros2pkg-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "a50b79ad2fc50b2371fc9c87bbfe9abbc23e095c";
        hash = "sha256-GU0eBbxQTt6+FwlBSAJBhwxIFjY3vnuKNvHQSCe/Ow8=";
      };
    };
  });
  meta = {
    description = "\n    The pkg command for ROS 2 command line tools.\n  ";
  };
})
