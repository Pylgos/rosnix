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
  version = "0.36.1-1";
  src = finalAttrs.passthru.sources."ros2pkg";
  propagatedNativeBuildInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" "python3-empy" "python3-importlib-resources" ]; };
  propagatedBuildInputs = [ ament-index-python ros2cli ];
  checkInputs = [ ament-flake8 ament-pep257 ament-xmllint launch launch-testing launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2pkg" = substituteSource {
      src = fetchgit {
        name = "ros2pkg-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "eda6ff94dd6fe7be823fb615089961b685cf4b00";
        hash = "sha256-ox89eXldw+mE3PeiHY6864qHSqzsOsqMuju3TGNNtYs=";
      };
    };
  });
  meta = {
    description = "The pkg command for ROS 2 command line tools.";
  };
})
