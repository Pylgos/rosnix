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
  version = "0.38.3-2";
  src = finalAttrs.passthru.sources."ros2run";
  propagatedNativeBuildInputs = [ ros2cli ros2pkg ];
  propagatedBuildInputs = [ ros2cli ros2pkg ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2run" = substituteSource {
      src = fetchgit {
        name = "ros2run-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "fabf297272b4ae3a3b88812c6263282dbdb350b1";
        hash = "sha256-FuX6+K3o8M3nusidaKfx2fGH4yUXg09+Vw7rp97Sqt8=";
      };
    };
  });
  meta = {
    description = "\n    The run command for ROS 2 command line tools.\n  ";
  };
})
