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
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_guard_conditions";
  version = "0.19.5-1";
  src = finalAttrs.passthru.sources."examples_rclpy_guard_conditions";
  propagatedBuildInputs = [ rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_guard_conditions" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_guard_conditions-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "c65b074a3f9fe3cf1a30861c68f4663f76f97978";
        hash = "sha256-KxYITeoQLCNkfqG7a+8fDlza/NZ/5N9OJQ/lKmmzv28=";
      };
    };
  });
  meta = {
    description = "Examples of using guard conditions.";
  };
})
