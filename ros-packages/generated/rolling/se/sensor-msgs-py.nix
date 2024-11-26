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
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."sensor_msgs_py";
  propagatedBuildInputs = [ sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sensor_msgs_py" = substituteSource {
      src = fetchgit {
        name = "sensor_msgs_py-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "1d4fb0b93f3b9ba6a18060ff7df42facab793184";
        hash = "sha256-hPudul+vvHgds0iitRrtOYVU7Hj6AayuHAFPcxQ/QMo=";
      };
    };
  });
  meta = {
    description = "A package for easy creation and reading of PointCloud2 messages in Python.";
  };
})
