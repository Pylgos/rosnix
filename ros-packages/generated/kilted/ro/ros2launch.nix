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
  version = "0.28.3-1";
  src = finalAttrs.passthru.sources."ros2launch";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-ros launch-xml launch-yaml ros2cli ros2pkg ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros launch-xml launch-yaml ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2launch" = substituteSource {
      src = fetchgit {
        name = "ros2launch-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "a77ddce552a1cea458be43d96de8bedc7adfd595";
        hash = "sha256-CS0Gf4zZVqsLIPmhCKu6toV22Ae85NG0nZ8RbSI4hb4=";
      };
    };
  });
  meta = {
    description = "\n    The launch command for ROS 2 command line tools.\n  ";
  };
})
