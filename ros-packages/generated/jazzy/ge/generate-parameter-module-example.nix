{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  generate-parameter-library-py,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "generate_parameter_module_example";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."generate_parameter_module_example";
  propagatedNativeBuildInputs = [ generate-parameter-library generate-parameter-library-py rclpy ];
  propagatedBuildInputs = [ generate-parameter-library generate-parameter-library-py rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "generate_parameter_module_example" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_module_example-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "c264d53c8ebcc9bc34b2ffbedc3e89498ba1fc45";
        hash = "sha256-Oo5Y0wijKiyg68WugHrYK+XJ9hr3WN4jsGB7e6SYYHc=";
      };
    };
  });
  meta = {
    description = "Example usage of generate_parameter_library for a python module";
  };
})
