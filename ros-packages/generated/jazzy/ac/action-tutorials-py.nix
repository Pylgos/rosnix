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
  version = "0.33.5-1";
  src = finalAttrs.passthru.sources."action_tutorials_py";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ action-tutorials-interfaces ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "action_tutorials_py" = substituteSource {
      src = fetchgit {
        name = "action_tutorials_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "f99ed6007497efa72297e0fe3c73f9977b960921";
        hash = "sha256-zhXHMPPYCn8uNithB7nsjnfp6VSyKyrCqqRB/7JgXS0=";
      };
    };
  });
  meta = {
    description = "Python action tutorial code";
  };
})
