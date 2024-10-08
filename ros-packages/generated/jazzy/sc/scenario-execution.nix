{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  py-trees,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "scenario_execution" = substituteSource {
      src = fetchgit {
        name = "scenario_execution-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "78b21ff264dffc9f6120b97d2c4074a63450cdc5";
        hash = "sha256-XlhKnH0DM2rt1LeexkMw+kVKxSNTw+0SSYQmpT5AezQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "scenario_execution";
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."scenario_execution";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ py-trees ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-antlr4" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Scenario Execution";
  };
})
