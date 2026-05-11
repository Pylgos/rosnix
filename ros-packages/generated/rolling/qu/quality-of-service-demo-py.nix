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
  version = "0.38.0-1";
  src = finalAttrs.passthru.sources."quality_of_service_demo_py";
  propagatedNativeBuildInputs = [ example-interfaces rclpy sensor-msgs ];
  propagatedBuildInputs = [ example-interfaces rclpy sensor-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "quality_of_service_demo_py" = substituteSource {
      src = fetchgit {
        name = "quality_of_service_demo_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "e128a5b3c4949cf561bc1e31b318209756628588";
        hash = "sha256-ORKjhSmIcd6idkyfZu8ueHXqpVM6lFiP6x491gOhXBI=";
      };
    };
  });
  meta = {
    description = "Python Demo applications for Quality of Service features";
  };
})
