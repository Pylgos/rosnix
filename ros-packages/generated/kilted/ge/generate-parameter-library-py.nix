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
  version = "0.7.1-1";
  src = finalAttrs.passthru.sources."generate_parameter_library_py";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" "python3-jinja2" "python3-typeguard" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3" "python3-jinja2" "python3-typeguard" "python3-yaml" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "generate_parameter_library_py" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library_py-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "06e080d987e2a60d37415f741cac8bf147887a01";
        hash = "sha256-lgc2eCYXEokRU8uFhADPP/3YZDxLUfH/5DCSW+8odNI=";
      };
    };
  });
  meta = {
    description = "Python to generate ROS parameter library.";
  };
})
