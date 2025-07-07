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
  version = "0.39.2-1";
  src = finalAttrs.passthru.sources."ros2multicast";
  propagatedNativeBuildInputs = [ ros2cli ];
  propagatedBuildInputs = [ ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2multicast" = substituteSource {
      src = fetchgit {
        name = "ros2multicast-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "dcd4ad52051c3ec397ff612982619534422455e6";
        hash = "sha256-Wfq1HpVIuHUZWCeUUpNHGWdsWAfVtegfiU62I1CVtS0=";
      };
    };
  });
  meta = {
    description = "\n    The multicast command for ROS 2 command line tools.\n  ";
  };
})
