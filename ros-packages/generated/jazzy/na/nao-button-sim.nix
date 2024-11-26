{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nao-lola-sensor-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "nao_button_sim";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."nao_button_sim";
  propagatedBuildInputs = [ nao-lola-sensor-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nao_button_sim" = substituteSource {
      src = fetchgit {
        name = "nao_button_sim-source";
        url = "https://github.com/ros2-gbp/nao_button_sim-release.git";
        rev = "2079860e6e50b930bf87f6000645ecabb9eb67d7";
        hash = "sha256-IV6xrXwb9dZjmwilXG0QxfVUpofGVKBxJdaqAVjcCO8=";
      };
    };
  });
  meta = {
    description = "Allows simulating button presses through command line interface";
  };
})
