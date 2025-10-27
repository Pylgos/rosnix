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
  version = "0.21.3-1";
  src = finalAttrs.passthru.sources."examples_rclpy_guard_conditions";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_guard_conditions" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_guard_conditions-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "f322a7188bd7a357729b766af029c6a4f7850f34";
        hash = "sha256-+e0OBFiqaF/J/S/E/32LPJbnic7eE00xGqIc+bI5e5s=";
      };
    };
  });
  meta = {
    description = "Examples of using guard conditions.";
  };
})
