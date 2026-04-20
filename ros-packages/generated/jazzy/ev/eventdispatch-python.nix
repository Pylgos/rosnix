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
  version = "0.2.29-1";
  src = finalAttrs.passthru.sources."eventdispatch_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "eventdispatch_python" = substituteSource {
      src = fetchgit {
        name = "eventdispatch_python-source";
        url = "https://github.com/ros2-gbp/ros2_eventdispatch-release.git";
        rev = "8e631d250ec35f4a5f4934cfe45c6d45336e6399";
        hash = "sha256-4kETwnHoDubqPEl1N/HPmcqNIBlFmM/kZpjbyqAdHCk=";
      };
    };
  });
  meta = {
    description = "python-eventdispatch for ROS2 distribution";
  };
})
