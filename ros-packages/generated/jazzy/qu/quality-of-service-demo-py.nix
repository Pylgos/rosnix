{
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
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "quality_of_service_demo_py";
  version = "0.33.5-1";
  src = finalAttrs.passthru.sources."quality_of_service_demo_py";
  propagatedBuildInputs = [ rclpy sensor-msgs std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "quality_of_service_demo_py" = substituteSource {
        src = fetchgit {
          name = "quality_of_service_demo_py-source";
          url = "https://github.com/ros2-gbp/demos-release.git";
          rev = "c90457e4ba8617ed1e272124b73591e8756302a9";
          hash = "sha256-fY+oCQleHzMZDE1VtYC6I8b5P5/ZnpBJwooWC8SRPQY=";
        };
      };
    });
  };
  meta = {
    description = "Python Demo applications for Quality of Service features";
  };
})
