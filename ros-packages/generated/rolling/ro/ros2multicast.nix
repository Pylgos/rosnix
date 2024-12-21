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
  version = "0.36.1-1";
  src = finalAttrs.passthru.sources."ros2multicast";
  propagatedBuildInputs = [ ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2multicast" = substituteSource {
      src = fetchgit {
        name = "ros2multicast-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "92f718bdfa3c311827fa8c038ba4266e0feb85c6";
        hash = "sha256-brtax0mqAoc2zYolQ0GyWDmgP7VF7uWaJCuovbHY19E=";
      };
    };
  });
  meta = {
    description = "The multicast command for ROS 2 command line tools.";
  };
})
