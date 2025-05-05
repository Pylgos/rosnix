{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "py_trees";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."py_trees";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pydot" "python3-setuptools" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" "python3-setuptools" ]; };
  passthru.sources = mkSourceSet (sources: {
    "py_trees" = substituteSource {
      src = fetchgit {
        name = "py_trees-source";
        url = "https://github.com/ros2-gbp/py_trees-release.git";
        rev = "8a2c560f93c515ecf779d705c99a70902e2a967f";
        hash = "sha256-4JJxkXa1T8WcNLkaFC9B9cWu/5FiUQA1wQmJpZLMIIQ=";
      };
    };
  });
  meta = {
    description = "\n    Pythonic implementation of behaviour trees.\n  ";
  };
})
