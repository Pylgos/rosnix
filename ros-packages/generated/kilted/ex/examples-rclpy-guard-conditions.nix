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
  version = "0.20.5-1";
  src = finalAttrs.passthru.sources."examples_rclpy_guard_conditions";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_guard_conditions" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_guard_conditions-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "df629c1d029f957e470d969b519663cf2ab265d6";
        hash = "sha256-wTHBuaOZHBaCeJO2VWbetPxNeUj1D8RaOmMHABjnJeM=";
      };
    };
  });
  meta = {
    description = "Examples of using guard conditions.";
  };
})
