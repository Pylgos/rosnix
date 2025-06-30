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
  version = "0.26.8-1";
  src = finalAttrs.passthru.sources."ros2launch";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-ros launch-xml launch-yaml ros2cli ros2pkg ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros launch-xml launch-yaml ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2launch" = substituteSource {
      src = fetchgit {
        name = "ros2launch-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "c80dbee7013dbf6a1c8120f2a593ee1abcd4f234";
        hash = "sha256-cxiZ9jnWEWp/ztjwJswCQSsZuWeYZ7enkRTA0Dn+Otg=";
      };
    };
  });
  meta = {
    description = "\n    The launch command for ROS 2 command line tools.\n  ";
  };
})
