{
  ament-copyright,
  ament-flake8,
  ament-mypy,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rosidl_cli";
  version = "5.3.0-1";
  src = finalAttrs.passthru.sources."rosidl_cli";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-argcomplete" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_cli" = substituteSource {
      src = fetchgit {
        name = "rosidl_cli-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "3dec69bf1c4cbc85f48535bd56738fbb3c27f716";
        hash = "sha256-KZPNTTtgwmqBdsqYZ2ZpkEXI7t08WP8G4YqY/h8/Ay0=";
      };
    };
  });
  meta = {
    description = "\n    Command line tools for ROS interface generation.\n  ";
  };
})
