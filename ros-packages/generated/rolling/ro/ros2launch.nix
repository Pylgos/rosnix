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
  launch-ros,
  mkSourceSet,
  ros2cli,
  ros2pkg,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2launch";
  version = "0.30.0-1";
  src = finalAttrs.passthru.sources."ros2launch";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-ros ros2cli ros2pkg ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2launch" = substituteSource {
      src = fetchgit {
        name = "ros2launch-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "d8d88ce96cd310adf4c4767ef436b30bc9701e03";
        hash = "sha256-06m3ZBA7Evt5FR0onc8WdB7nIfEsZw8+R+cu53aFs84=";
      };
    };
  });
  meta = {
    description = "\n    The launch command for ROS 2 command line tools.\n  ";
  };
})
