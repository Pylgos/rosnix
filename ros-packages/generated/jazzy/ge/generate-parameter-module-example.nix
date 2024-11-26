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
  version = "0.3.9-1";
  src = finalAttrs.passthru.sources."generate_parameter_module_example";
  propagatedNativeBuildInputs = [ generate-parameter-library-py ];
  propagatedBuildInputs = [ generate-parameter-library rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "generate_parameter_module_example" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_module_example-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "bfc9860c2161006188946bfca4d00bc0d1f7c0ff";
        hash = "sha256-Xd9FBLcNIN6hPET+5ZdyWqsg0Qf3Ijvil9+lg5I6riQ=";
      };
    };
  });
  meta = {
    description = "Example usage of generate_parameter_library for a python module";
  };
})
