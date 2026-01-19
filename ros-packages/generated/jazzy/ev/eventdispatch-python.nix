{
  ament-copyright,
  ament-flake8,
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
  pname = "eventdispatch_python";
  version = "0.2.26-1";
  src = finalAttrs.passthru.sources."eventdispatch_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "eventdispatch_python" = substituteSource {
      src = fetchgit {
        name = "eventdispatch_python-source";
        url = "https://github.com/ros2-gbp/ros2_eventdispatch-release.git";
        rev = "3f8629b2d4bab76efb9800252f18b45e393cfbc3";
        hash = "sha256-dAzfeJ5mVhuuSFcOR6IB65EFdYWoBdpxkLw55wGbcz8=";
      };
    };
  });
  meta = {
    description = "python-eventdispatch for ROS2 distribution";
  };
})
