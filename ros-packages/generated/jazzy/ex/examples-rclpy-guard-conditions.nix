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
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_guard_conditions";
  propagatedBuildInputs = [ rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclpy_guard_conditions" = substituteSource {
        src = fetchgit {
          name = "examples_rclpy_guard_conditions-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "8e9f8d35826ef49362df7a763dd229f27d3b651a";
          hash = "sha256-XuoPymroDyoXWYabkwprlEVdOyalu5DjW759xyQjsPs=";
        };
      };
    });
  };
  meta = {
    description = "Examples of using guard conditions.";
  };
})
