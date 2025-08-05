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
  version = "0.40.0-1";
  src = finalAttrs.passthru.sources."ros2multicast";
  propagatedNativeBuildInputs = [ ros2cli ];
  propagatedBuildInputs = [ ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2multicast" = substituteSource {
      src = fetchgit {
        name = "ros2multicast-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "a9dcf4f5482bd33335cadb940c44363d66b045a4";
        hash = "sha256-y4MtGD3lFlghrnuHoaD7yLr2amwbN/d45nw/gtr0DdE=";
      };
    };
  });
  meta = {
    description = "\n    The multicast command for ROS 2 command line tools.\n  ";
  };
})
