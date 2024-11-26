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
  version = "2.2.1-4";
  src = finalAttrs.passthru.sources."py_trees";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "py_trees" = substituteSource {
        src = fetchgit {
          name = "py_trees-source";
          url = "https://github.com/ros2-gbp/py_trees-release.git";
          rev = "6aa58f8414fb672071074c6d4621c3ca8968488f";
          hash = "sha256-D4D4KgMpC2gXiPRmmTMkb2IW5rzxXUbEUFu5RVEnaqc=";
        };
      };
    });
  };
  meta = {
    description = "Pythonic implementation of behaviour trees.";
  };
})
