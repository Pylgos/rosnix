{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  buildAmentPythonPackage,
  demo-nodes-py,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  mkSourceSet,
  nodl-python,
  ros2launch,
  rosSystemPackages,
  sros2,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2launch_security";
  version = "1.0.0-4";
  src = finalAttrs.passthru.sources."ros2launch_security";
  propagatedNativeBuildInputs = [ ament-index-python nodl-python ros2launch sros2 ];
  propagatedBuildInputs = [ ament-index-python nodl-python ros2launch sros2 ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 demo-nodes-py launch-ros ros2launch sros2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2launch_security" = substituteSource {
      src = fetchgit {
        name = "ros2launch_security-source";
        url = "https://github.com/ros2-gbp/ros2launch_security-release.git";
        rev = "43e55f1907071b6ac525d871539b6a3a8b9f11ca";
        hash = "sha256-MM1mvGLVBpSePXEUKQScahRPpulucGxMTaTp+jSKbNo=";
      };
    };
  });
  meta = {
    description = "Security extensions for ros2 launch";
  };
})
