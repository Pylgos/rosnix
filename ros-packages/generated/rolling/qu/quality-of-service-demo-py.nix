{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "quality_of_service_demo_py";
  version = "0.37.4-1";
  src = finalAttrs.passthru.sources."quality_of_service_demo_py";
  propagatedNativeBuildInputs = [ rclpy sensor-msgs std-msgs ];
  propagatedBuildInputs = [ rclpy sensor-msgs std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "quality_of_service_demo_py" = substituteSource {
      src = fetchgit {
        name = "quality_of_service_demo_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "982fd07510ed4113db5c62ae9d6a6919a3e52f86";
        hash = "sha256-O/yde3FBuEL4dSZKYiTYSa86N6P3b/rJsKDY/RpmXfc=";
      };
    };
  });
  meta = {
    description = "Python Demo applications for Quality of Service features";
  };
})
