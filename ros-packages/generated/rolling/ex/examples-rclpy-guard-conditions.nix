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
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_guard_conditions";
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_guard_conditions";
  propagatedBuildInputs = [ rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_guard_conditions" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_guard_conditions-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "b1e1385c4b07c73bde9569b1733fb62eaf792313";
        hash = "sha256-x/YKWC757ey6knuUgItPKZqYHzB+omupj2RP5+E15FA=";
      };
    };
  });
  meta = {
    description = "Examples of using guard conditions.";
  };
})
