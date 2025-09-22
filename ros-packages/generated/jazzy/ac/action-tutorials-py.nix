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
  version = "0.33.7-1";
  src = finalAttrs.passthru.sources."action_tutorials_py";
  propagatedNativeBuildInputs = [ action-tutorials-interfaces rclpy ];
  propagatedBuildInputs = [ action-tutorials-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "action_tutorials_py" = substituteSource {
      src = fetchgit {
        name = "action_tutorials_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "56091d94094d310aed6cb39e93d711f5644bff03";
        hash = "sha256-6/QZ7Te9vY1aaA37o47Yt6oR2u7LPYrsHbAO7Ds5w0k=";
      };
    };
  });
  meta = {
    description = "Python action tutorial code";
  };
})
