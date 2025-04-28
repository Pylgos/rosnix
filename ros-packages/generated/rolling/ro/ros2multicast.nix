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
  ros2cli,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2multicast";
  version = "0.39.0-1";
  src = finalAttrs.passthru.sources."ros2multicast";
  propagatedBuildInputs = [ ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2multicast" = substituteSource {
      src = fetchgit {
        name = "ros2multicast-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "c0b7a44544ae1a2a8f52c3e2744b6a91855eed6a";
        hash = "sha256-V3MPLTNjstj6yHEfMFj8aJcOatVpwcNhcPj3WbBc3aU=";
      };
    };
  });
  meta = {
    description = "The multicast command for ROS 2 command line tools.";
  };
})
