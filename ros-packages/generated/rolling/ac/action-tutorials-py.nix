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
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."action_tutorials_py";
  propagatedBuildInputs = [ example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "action_tutorials_py" = substituteSource {
        src = fetchgit {
          name = "action_tutorials_py-source";
          url = "https://github.com/ros2-gbp/demos-release.git";
          rev = "9ec2c64926c2ef7414772c1d55bff30f0d0fefb7";
          hash = "sha256-XqK0Pp2X+GBo7bbgxbTTw/yoruTws4JkAAWQwAvDkPE=";
        };
      };
    });
  };
  meta = {
    description = "Python action tutorial code";
  };
})
