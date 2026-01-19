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
  version = "0.36.4-1";
  src = finalAttrs.passthru.sources."action_tutorials_py";
  propagatedNativeBuildInputs = [ example-interfaces rclpy ];
  propagatedBuildInputs = [ example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "action_tutorials_py" = substituteSource {
      src = fetchgit {
        name = "action_tutorials_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "2201282e4bedc9e02d70518438ef645faeb611f8";
        hash = "sha256-cvWqthnrZ9A987teh+5gP88h/v0PBJlmBODbslF6FWg=";
      };
    };
  });
  meta = {
    description = "Python action tutorial code";
  };
})
