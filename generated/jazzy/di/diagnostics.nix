{
  ament_cmake,
  buildRosPackage,
  diagnostic_aggregator,
  diagnostic_common_diagnostics,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  self_test,
  substituteSource,
}:
let
  sources = rec {
    diagnostics-904ae24d5e00bd38b48157ff4446b384090e42b5 = substituteSource {
      src = fetchgit {
        name = "diagnostics-904ae24d5e00bd38b48157ff4446b384090e42b5-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "904ae24d5e00bd38b48157ff4446b384090e42b5";
        hash = "sha256-0AXbNvElkiT1PqbiHubhKiwwmydQlK+XKAjtVPSW45E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostics";
  version = "4.2.1-1";
  src = sources.diagnostics-904ae24d5e00bd38b48157ff4446b384090e42b5;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_aggregator diagnostic_common_diagnostics diagnostic_updater self_test ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "diagnostics";
  };
}
