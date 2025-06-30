{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "action_tutorials_py";
  version = "0.37.1-1";
  src = finalAttrs.passthru.sources."action_tutorials_py";
  propagatedNativeBuildInputs = [ example-interfaces rclpy ];
  propagatedBuildInputs = [ example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "action_tutorials_py" = substituteSource {
      src = fetchgit {
        name = "action_tutorials_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "79f7ed600f14b44cca6d7f545910559b252782ba";
        hash = "sha256-UHxaBaTJ+Fc5ZThVUDDt+raNl2F1ZopV0pjO+NvuVY8=";
      };
    };
  });
  meta = {
    description = "Python action tutorial code";
  };
})
