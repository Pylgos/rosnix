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
  version = "0.3.9-1";
  src = finalAttrs.passthru.sources."generate_parameter_library_py";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" "python3-typeguard" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3" "python3-jinja2" "python3-typeguard" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "generate_parameter_library_py" = substituteSource {
        src = fetchgit {
          name = "generate_parameter_library_py-source";
          url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
          rev = "d43239ef09cbdfd31c49607c4ee8f3199c3f9e75";
          hash = "sha256-Us4uv/679JK8Dks4p6NfrzqBVN2UvoL2fq24oE1Mt5U=";
        };
      };
    });
  };
  meta = {
    description = "Python to generate ROS parameter library.";
  };
})
