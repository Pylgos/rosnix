{
  ament-copyright,
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
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."generate_parameter_library_py";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" "python3-typeguard" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3" "python3-jinja2" "python3-typeguard" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "generate_parameter_library_py" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library_py-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "ec2ff8e161527f49eafc74053b0e85c2f9bb1130";
        hash = "sha256-9BKOWixxSTu7XY6h8I6vW/splx1YtIW9R+ZNX1SHsw0=";
      };
    };
  });
  meta = {
    description = "Python to generate ROS parameter library.";
  };
})
