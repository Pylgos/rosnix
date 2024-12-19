{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  tf2-msgs,
  tf2-py,
  tf2-ros-py,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tf2_tools";
  version = "0.36.6-1";
  src = finalAttrs.passthru.sources."tf2_tools";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ rclpy tf2-msgs tf2-py tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphviz" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tf2_tools" = substituteSource {
      src = fetchgit {
        name = "tf2_tools-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "2be84cfb1eb95199bbd06aff201f03cc160e5d6b";
        hash = "sha256-XJCy4S4oVdqeO01IC1BrEMpu6paXhWvr6TIhDrljntM=";
      };
    };
  });
  meta = {
    description = "tf2_tools";
  };
})
