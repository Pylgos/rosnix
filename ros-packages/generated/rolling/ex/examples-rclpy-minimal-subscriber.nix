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
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_minimal_subscriber";
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_subscriber";
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclpy_minimal_subscriber" = substituteSource {
        src = fetchgit {
          name = "examples_rclpy_minimal_subscriber-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "1da6c169719514e472cff43532df9a29624ca9a3";
          hash = "sha256-S4Gqzvon14ihe/AAFV+KRE21Z92aIG1y/UalEMZczOc=";
        };
      };
    });
  };
  meta = {
    description = "Examples of minimal subscribers using rclpy.";
  };
})
