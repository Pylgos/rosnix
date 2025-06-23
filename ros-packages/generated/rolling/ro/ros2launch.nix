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
  version = "0.29.1-1";
  src = finalAttrs.passthru.sources."ros2launch";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-ros ros2cli ros2pkg ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2launch" = substituteSource {
      src = fetchgit {
        name = "ros2launch-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "fc3076b8cd46834f4fb5b52d95be85451178e253";
        hash = "sha256-KJxdxyrcg2I2zTM4z+//kfsHXARuyST2WSJ37TRmhH4=";
      };
    };
  });
  meta = {
    description = "\n    The launch command for ROS 2 command line tools.\n  ";
  };
})
