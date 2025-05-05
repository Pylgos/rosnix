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
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."examples_rclpy_guard_conditions";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_guard_conditions" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_guard_conditions-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "f5f2c6ba913e02d5e8ca812a06bd483c33418728";
        hash = "sha256-C4lzXYFgXQjsi6VE5/Mgf5tDpfvKdjJGmsPGQH5I9Ak=";
      };
    };
  });
  meta = {
    description = "Examples of using guard conditions.";
  };
})
