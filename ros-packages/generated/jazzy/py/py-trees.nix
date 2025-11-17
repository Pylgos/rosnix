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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."py_trees";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pydot" "python3-setuptools" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" "python3-setuptools" ]; };
  passthru.sources = mkSourceSet (sources: {
    "py_trees" = substituteSource {
      src = fetchgit {
        name = "py_trees-source";
        url = "https://github.com/ros2-gbp/py_trees-release.git";
        rev = "c22ff13c49f20ead64b69d46be60005fff4661f7";
        hash = "sha256-EKaQD6Xw1fWFg8lmxO64C3HBrBqlGnhj8t7j+J9qwto=";
      };
    };
  });
  meta = {
    description = "\n    Pythonic implementation of behaviour trees.\n  ";
  };
})
