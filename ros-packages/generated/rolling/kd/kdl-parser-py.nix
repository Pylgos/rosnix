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
  python-orocos-kdl-vendor,
  rosSystemPackages,
  substituteSource,
  urdfdom-py,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "kdl_parser_py";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."kdl_parser_py";
  propagatedNativeBuildInputs = [ python-orocos-kdl-vendor urdfdom-py ];
  propagatedBuildInputs = [ python-orocos-kdl-vendor urdfdom-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kdl_parser_py" = substituteSource {
      src = fetchgit {
        name = "kdl_parser_py-source";
        url = "https://github.com/ros2-gbp/kdl_parser_py-release.git";
        rev = "e4a08f12367c8b1351a07ffea612893482ea2102";
        hash = "sha256-DaxVyOW9aqwn57/iymLjoqkE3yMvgdLEdh4A5AJPlbs=";
      };
    };
  });
  meta = {
    description = "\n   ";
  };
})
