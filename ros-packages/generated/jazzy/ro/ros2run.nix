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
  ros2pkg,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2run";
  version = "0.32.9-1";
  src = finalAttrs.passthru.sources."ros2run";
  propagatedNativeBuildInputs = [ ros2cli ros2pkg ];
  propagatedBuildInputs = [ ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2run" = substituteSource {
      src = fetchgit {
        name = "ros2run-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "ffbda361e772ea7d96b67b00ad5895828bd52249";
        hash = "sha256-iT/ltZ8R4oCN/FyQLUtkwGHjkUO+SFrtHT27sgBg830=";
      };
    };
  });
  meta = {
    description = "\n    The run command for ROS 2 command line tools.\n  ";
  };
})
