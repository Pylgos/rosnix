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
  version = "0.36.3-1";
  src = finalAttrs.passthru.sources."quality_of_service_demo_py";
  propagatedNativeBuildInputs = [ rclpy sensor-msgs std-msgs ];
  propagatedBuildInputs = [ rclpy sensor-msgs std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "quality_of_service_demo_py" = substituteSource {
      src = fetchgit {
        name = "quality_of_service_demo_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "963854588fc707b5d5e79a5c19fbb633e5a04b32";
        hash = "sha256-53YM5OAdWxXGOSnxV/3oBQks6FqyKfwZM2GXCaQe0Gs=";
      };
    };
  });
  meta = {
    description = "Python Demo applications for Quality of Service features";
  };
})
