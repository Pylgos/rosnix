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
  version = "0.33.9-1";
  src = finalAttrs.passthru.sources."action_tutorials_py";
  propagatedNativeBuildInputs = [ action-tutorials-interfaces rclpy ];
  propagatedBuildInputs = [ action-tutorials-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "action_tutorials_py" = substituteSource {
      src = fetchgit {
        name = "action_tutorials_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "4139e02e845ec2c2ba8601207749f0e2ae66fc6b";
        hash = "sha256-qdsWROGkT977pmqcD58c2m5DpuuJPc3xjlYJYOS8Qcc=";
      };
    };
  });
  meta = {
    description = "Python action tutorial code";
  };
})
