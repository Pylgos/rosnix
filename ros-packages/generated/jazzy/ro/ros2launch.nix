{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-xml,
  launch-yaml,
  mkSourceSet,
  ros2cli,
  ros2pkg,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2launch";
  version = "0.26.5-2";
  src = finalAttrs.passthru.sources."ros2launch";
  propagatedBuildInputs = [ ament-index-python launch launch-ros launch-xml launch-yaml ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2launch" = substituteSource {
        src = fetchgit {
          name = "ros2launch-source";
          url = "https://github.com/ros2-gbp/launch_ros-release.git";
          rev = "4fcbd74e9fe1d7b272ad91b099ae03f394b7774d";
          hash = "sha256-E6Ud3YgAuns/SgPWysda6aIg4WL4tIsihgZwqbOHeVk=";
        };
      };
    });
  };
  meta = {
    description = "The launch command for ROS 2 command line tools.";
  };
})
