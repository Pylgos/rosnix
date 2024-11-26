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
  version = "0.14.0-1";
  src = finalAttrs.passthru.sources."rosidl_runtime_py";
  propagatedNativeBuildInputs = [ rosidl-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint std-msgs std-srvs test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_runtime_py" = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_py-source";
        url = "https://github.com/ros2-gbp/rosidl_runtime_py-release.git";
        rev = "51c5352a777f1a15d85273ded90d0133daf9be29";
        hash = "sha256-p8FDKIm1mdJdb91wwQ4jtJRlgYxNdaaXHgTZtuwpIlE=";
      };
    };
  });
  meta = {
    description = "Runtime utilities for working with generated ROS interfaces in Python.";
  };
})
