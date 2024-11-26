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
  version = "0.36.0-1";
  src = finalAttrs.passthru.sources."ros2multicast";
  propagatedBuildInputs = [ ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2multicast" = substituteSource {
      src = fetchgit {
        name = "ros2multicast-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "63688b2f45477a4a60b0872c79b9afa3031e6454";
        hash = "sha256-wIwD0Z+Lzy/WCfl8X9B8zgfcoJq+iSgWTu0iykqBvXo=";
      };
    };
  });
  meta = {
    description = "The multicast command for ROS 2 command line tools.";
  };
})
