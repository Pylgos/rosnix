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
  sensor-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "quality_of_service_demo_py";
  version = "0.37.8-2";
  src = finalAttrs.passthru.sources."quality_of_service_demo_py";
  propagatedNativeBuildInputs = [ example-interfaces rclpy sensor-msgs ];
  propagatedBuildInputs = [ example-interfaces rclpy sensor-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "quality_of_service_demo_py" = substituteSource {
      src = fetchgit {
        name = "quality_of_service_demo_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "69a1a5e6c86e01871765352a1c4009e744c5f6bf";
        hash = "sha256-s6Q5tOl8Iy24Lj5AvMnSBGV7IBCFPX89vjKYgS3jBwI=";
      };
    };
  });
  meta = {
    description = "Python Demo applications for Quality of Service features";
  };
})
