{
  ament-copyright,
  ament-flake8,
  ament-mypy,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle,
  lifecycle-msgs,
  mkSourceSet,
  rclpy,
  ros-testing,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "lifecycle_py";
  version = "0.38.0-1";
  src = finalAttrs.passthru.sources."lifecycle_py";
  propagatedNativeBuildInputs = [ example-interfaces lifecycle-msgs rclpy ];
  propagatedBuildInputs = [ example-interfaces lifecycle-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint lifecycle ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle_py" = substituteSource {
      src = fetchgit {
        name = "lifecycle_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "cd27063c0af4f64716781c9949f629c48637e70f";
        hash = "sha256-ZvnrEXVTOghBxKm4JqkdfDquTWblFg5h+6ub4+PlikE=";
      };
    };
  });
  meta = {
    description = "Package containing demos for rclpy lifecycle implementation";
  };
})
