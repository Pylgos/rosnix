{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "sensor_msgs_py";
  version = "5.7.0-1";
  src = finalAttrs.passthru.sources."sensor_msgs_py";
  propagatedNativeBuildInputs = [ sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sensor_msgs_py" = substituteSource {
      src = fetchgit {
        name = "sensor_msgs_py-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "144a9ec40d72b764da0cd098f08d4c8b0884d60b";
        hash = "sha256-2r+2rfkkMaAxfjltgouxdCy3eYzRT3lgkzecktRl3ms=";
      };
    };
  });
  meta = {
    description = "A package for easy creation and reading of PointCloud2 messages in Python.";
  };
})
