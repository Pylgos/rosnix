{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "robot_upstart";
  version = "1.0.4-1";
  src = finalAttrs.passthru.sources."robot_upstart";
  propagatedNativeBuildInputs = [ ament-index-python ];
  propagatedBuildInputs = [ ament-index-python ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "robot_upstart" = substituteSource {
      src = fetchgit {
        name = "robot_upstart-source";
        url = "https://github.com/clearpath-gbp/robot_upstart-release.git";
        rev = "bd299c8ce71d1419b31afc8daebfe81daa2c4e13";
        hash = "sha256-rSLxwHWQH5oc7pInTJF/CiLl1feRETCyJtPSyv5ioEE=";
      };
    };
  });
  meta = {
    description = "\n    The robot_upstart package provides scripts which may be used to install\n    and uninstall Ubuntu Linux upstart jobs which launch groups of roslaunch files.\n  ";
  };
})
