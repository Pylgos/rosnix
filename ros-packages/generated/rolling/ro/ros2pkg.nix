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
  version = "0.39.2-1";
  src = finalAttrs.passthru.sources."ros2pkg";
  propagatedNativeBuildInputs = [ ament-copyright ament-index-python ros2cli ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" "python3-empy" "python3-importlib-resources" ]; };
  propagatedBuildInputs = [ ament-copyright ament-index-python ros2cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg-modules" "python3-empy" "python3-importlib-resources" ]; };
  checkInputs = [ ament-flake8 ament-pep257 ament-xmllint launch launch-testing launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2pkg" = substituteSource {
      src = fetchgit {
        name = "ros2pkg-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "7a68a2bb4653aea8f19814d8434e4afc5f9d208e";
        hash = "sha256-n/Qzcz9UplkEreQy6nrB2mnZYztt/7Yl5YNYEAC0tBU=";
      };
    };
  });
  meta = {
    description = "\n    The pkg command for ROS 2 command line tools.\n  ";
  };
})
