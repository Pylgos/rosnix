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
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_minimal_client";
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_client";
  propagatedNativeBuildInputs = [ example-interfaces rclpy std-msgs ];
  propagatedBuildInputs = [ example-interfaces rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "ada0373949d7b763491b4141fc988ca0339ef333";
        hash = "sha256-IWyCA1oVBsrgofrPH764+uJP1NyjEK/px9cXcBxi4FM=";
      };
    };
  });
  meta = {
    description = "Examples of minimal service clients using rclpy.";
  };
})
