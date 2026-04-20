{
  action-tutorials-interfaces,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
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
  version = "0.33.10-1";
  src = finalAttrs.passthru.sources."action_tutorials_py";
  propagatedNativeBuildInputs = [ action-tutorials-interfaces rclpy ];
  propagatedBuildInputs = [ action-tutorials-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "action_tutorials_py" = substituteSource {
      src = fetchgit {
        name = "action_tutorials_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "6d7f6312e9acfafd3c0ff0b21b0497e3f77914eb";
        hash = "sha256-Pcw0id0rDAbzE5vOEm7NiXeizshxiyg6JGAxHNXYPns=";
      };
    };
  });
  meta = {
    description = "Python action tutorial code";
  };
})
