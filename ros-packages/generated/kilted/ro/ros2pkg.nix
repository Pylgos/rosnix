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
  version = "0.38.2-1";
  src = finalAttrs.passthru.sources."ros2pkg";
  propagatedNativeBuildInputs = [ ament-copyright ament-index-python ros2cli ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" "python3-empy" ]; };
  propagatedBuildInputs = [ ament-copyright ament-index-python ros2cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg-modules" "python3-empy" ]; };
  checkInputs = [ ament-flake8 ament-pep257 ament-xmllint launch launch-testing launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2pkg" = substituteSource {
      src = fetchgit {
        name = "ros2pkg-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "1fcdb1a72b14524ccb7f48a4a94a148f6513fb27";
        hash = "sha256-MFGAmVkRZ1eGamJCDH2Q0YzmsWC3pTkU8LV4+Zd3BR0=";
      };
    };
  });
  meta = {
    description = "\n    The pkg command for ROS 2 command line tools.\n  ";
  };
})
