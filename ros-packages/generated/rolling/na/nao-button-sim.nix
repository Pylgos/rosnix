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
  propagatedNativeBuildInputs = [ nao-lola-sensor-msgs ];
  propagatedBuildInputs = [ nao-lola-sensor-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nao_button_sim" = substituteSource {
      src = fetchgit {
        name = "nao_button_sim-source";
        url = "https://github.com/ros2-gbp/nao_button_sim-release.git";
        rev = "d32424bf386f95cffd3cd5ee49157a9922feef0f";
        hash = "sha256-IV6xrXwb9dZjmwilXG0QxfVUpofGVKBxJdaqAVjcCO8=";
      };
    };
  });
  meta = {
    description = "Allows simulating button presses through command line interface";
  };
})
