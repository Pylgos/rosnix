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
  version = "5.8.1-1";
  src = finalAttrs.passthru.sources."sensor_msgs_py";
  propagatedNativeBuildInputs = [ sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sensor_msgs_py" = substituteSource {
      src = fetchgit {
        name = "sensor_msgs_py-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "01eb9a466b24e8824e1a4af4262beecf33ca0e42";
        hash = "sha256-rXYM53Hv1Vdin256saCX+tohGQbOCJzhYuZCsJBovRQ=";
      };
    };
  });
  meta = {
    description = "A package for easy creation and reading of PointCloud2 messages in Python.";
  };
})
