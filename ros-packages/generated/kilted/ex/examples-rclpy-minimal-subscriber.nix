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
  version = "0.20.6-2";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_subscriber";
  propagatedNativeBuildInputs = [ rclpy std-msgs ];
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_subscriber" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_subscriber-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "08786c9d7ee9a1cabb9fab2fa5fe08a436d63641";
        hash = "sha256-2YA50ApXPlIAugCsdL64fTJ46sYPTScqOUz2boR/rQg=";
      };
    };
  });
  meta = {
    description = "Examples of minimal subscribers using rclpy.";
  };
})
