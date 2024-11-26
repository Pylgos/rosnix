{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-xml,
  launch-yaml,
  mkSourceSet,
  ros2cli,
  ros2pkg,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2launch";
  version = "0.28.0-1";
  src = finalAttrs.passthru.sources."ros2launch";
  propagatedBuildInputs = [ ament-index-python launch launch-ros launch-xml launch-yaml ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2launch" = substituteSource {
        src = fetchgit {
          name = "ros2launch-source";
          url = "https://github.com/ros2-gbp/launch_ros-release.git";
          rev = "aca901c9b0e85a4a91e769306ce929b5f2520450";
          hash = "sha256-4nubTKAetkEzgyUzuQW+pWYYrV97ziZkmmzqYr0EFG4=";
        };
      };
    });
  };
  meta = {
    description = "The launch command for ROS 2 command line tools.";
  };
})
