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
  version = "4.9.3-1";
  src = finalAttrs.passthru.sources."rosidl_cli";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" "python3-importlib-metadata" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-argcomplete" "python3-importlib-metadata" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_cli" = substituteSource {
      src = fetchgit {
        name = "rosidl_cli-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "ecbac7116729ae91af1c2a1da8e81d967a28178d";
        hash = "sha256-9omrBsn/tv2IbPq+bPzV31dDb6y4gnyu0WnlVe6EgJ8=";
      };
    };
  });
  meta = {
    description = "Command line tools for ROS interface generation.";
  };
})
