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
  rosidl-parser,
  std-msgs,
  std-srvs,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rosidl_runtime_py";
  version = "0.13.1-2";
  src = finalAttrs.passthru.sources."rosidl_runtime_py";
  propagatedNativeBuildInputs = [ rosidl-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint std-msgs std-srvs test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_runtime_py" = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_py-source";
        url = "https://github.com/ros2-gbp/rosidl_runtime_py-release.git";
        rev = "0b05e57c72fb835489f909e39d6868e234957a7a";
        hash = "sha256-jytdOfWquw/4LfZWrw4Y5ENdwCIZr54jgWE40LjBpbU=";
      };
    };
  });
  meta = {
    description = "Runtime utilities for working with generated ROS interfaces in Python.";
  };
})
