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
  version = "0.33.6-1";
  src = finalAttrs.passthru.sources."action_tutorials_py";
  propagatedNativeBuildInputs = [ action-tutorials-interfaces rclpy ];
  propagatedBuildInputs = [ action-tutorials-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "action_tutorials_py" = substituteSource {
      src = fetchgit {
        name = "action_tutorials_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "8ad0c613a902cd1077d1e6211baa7a86494e647f";
        hash = "sha256-AjOzXF8254vBUYIAhgdYBQ+WzHL1kWNYcBUYqY+OrDU=";
      };
    };
  });
  meta = {
    description = "Python action tutorial code";
  };
})
