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
  rosidl-buffer-py,
  rosidl-parser,
  std-msgs,
  std-srvs,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rosidl_runtime_py";
  version = "0.15.2-1";
  src = finalAttrs.passthru.sources."rosidl_runtime_py";
  propagatedNativeBuildInputs = [ rosidl-buffer-py rosidl-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-yaml" ]; };
  propagatedBuildInputs = [ rosidl-buffer-py rosidl-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint std-msgs std-srvs test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_runtime_py" = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_py-source";
        url = "https://github.com/ros2-gbp/rosidl_runtime_py-release.git";
        rev = "7a93b42fc7a277fdd60fd053aacc71af604cc13d";
        hash = "sha256-bZHn5/Taptz/K7/UAXV/GayUt0hi9HSxAdfGG6cg0RQ=";
      };
    };
  });
  meta = {
    description = "Runtime utilities for working with generated ROS interfaces in Python.";
  };
})
