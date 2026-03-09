{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "generate_parameter_library_py";
  version = "0.7.0-1";
  src = finalAttrs.passthru.sources."generate_parameter_library_py";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" "python3-jinja2" "python3-typeguard" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3" "python3-jinja2" "python3-typeguard" "python3-yaml" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "generate_parameter_library_py" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library_py-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "a69f11d30bfb64a1b8bf8c31bf44375b6ec6035d";
        hash = "sha256-r6eJb7x0V5kVH998Lrw6E/CqAznlG10hFQMK7oNKTy0=";
      };
    };
  });
  meta = {
    description = "Python to generate ROS parameter library.";
  };
})
