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
  version = "3.7.0-1";
  src = finalAttrs.passthru.sources."launch_yaml";
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_yaml" = substituteSource {
      src = fetchgit {
        name = "launch_yaml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "f21f5fccf4638861fb319d3dfec4f7740c214aac";
        hash = "sha256-viqovmjlSV7DvFu1sVSL1j3wdwQN2IPrXBFBp14ydT0=";
      };
    };
  });
  meta = {
    description = "YAML frontend for the launch package.";
  };
})
