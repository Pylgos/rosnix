{
  ament-copyright,
  ament-flake8,
  ament-pep257,
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
  version = "5.3.5-1";
  src = finalAttrs.passthru.sources."sensor_msgs_py";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ sensor-msgs std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sensor_msgs_py" = substituteSource {
      src = fetchgit {
        name = "sensor_msgs_py-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "6c3323e5153a1c9c6dd9f54bdbbb039fde31873a";
        hash = "sha256-RyIafHfr3e2zSJlKB8OoYweMJErq7q9KrJqK/fGSmLo=";
      };
    };
  });
  meta = {
    description = "A package for easy creation and reading of PointCloud2 messages in Python.";
  };
})
