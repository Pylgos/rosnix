{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-msgs,
  flexbe-testing,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "flexbe_states" = substituteSource {
      src = fetchgit {
        name = "flexbe_states-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "4c86a317b76c58c3b06c4e002dafd18129c20e19";
        hash = "sha256-9nCf5YRLrdFBBRGVTkMGtiBfcHoiWNVdCLwqKnaSv3k=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "flexbe_states";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."flexbe_states";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ flexbe-core flexbe-msgs flexbe-testing rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "flexbe_states provides a collection of common generic predefined states.";
  };
})
