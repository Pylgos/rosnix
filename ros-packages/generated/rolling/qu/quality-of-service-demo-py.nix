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
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."quality_of_service_demo_py";
  propagatedBuildInputs = [ rclpy sensor-msgs std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "quality_of_service_demo_py" = substituteSource {
      src = fetchgit {
        name = "quality_of_service_demo_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "4614f6d8cd2c7a6a1e00471182633473f078adb5";
        hash = "sha256-Ayw3FtYpkqM4fU4VardTpCkA/BY0Y95XFz+5FJF0FCY=";
      };
    };
  });
  meta = {
    description = "Python Demo applications for Quality of Service features";
  };
})
