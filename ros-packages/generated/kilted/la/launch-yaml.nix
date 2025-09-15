{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_yaml";
  version = "3.8.3-1";
  src = finalAttrs.passthru.sources."launch_yaml";
  propagatedNativeBuildInputs = [ launch ];
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_yaml" = substituteSource {
      src = fetchgit {
        name = "launch_yaml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "175bda48da424b9fd9ea9fec9ef43c90759307ff";
        hash = "sha256-RFKTrYEZUn7sOSNZV3qviCwiLgFH06ceTlzJxZLcRfc=";
      };
    };
  });
  meta = {
    description = "YAML frontend for the launch package.";
  };
})
