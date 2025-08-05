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
  version = "0.15.1-1";
  src = finalAttrs.passthru.sources."rosidl_runtime_py";
  propagatedNativeBuildInputs = [ rosidl-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-yaml" ]; };
  propagatedBuildInputs = [ rosidl-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint std-msgs std-srvs test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_runtime_py" = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_py-source";
        url = "https://github.com/ros2-gbp/rosidl_runtime_py-release.git";
        rev = "2fea8d25b6d65edc0420e6689d21160f88a8b595";
        hash = "sha256-tK7yW3wbIhNU0lnPtP8ZrJYHIPY/SYTDx7ngkyNHoDo=";
      };
    };
  });
  meta = {
    description = "Runtime utilities for working with generated ROS interfaces in Python.";
  };
})
