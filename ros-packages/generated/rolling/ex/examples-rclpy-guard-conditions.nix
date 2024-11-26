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
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclpy_guard_conditions";
  propagatedBuildInputs = [ rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_guard_conditions" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_guard_conditions-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "e9a397bb2a176688d4110508aec9daf9cb5dd2bf";
        hash = "sha256-zuWIJ0V+FHD38z2gYTWve633kzmic4Ucfft5zqZBQLI=";
      };
    };
  });
  meta = {
    description = "Examples of using guard conditions.";
  };
})
