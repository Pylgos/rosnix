{
  ament_cmake,
  buildRosPackage,
  diagnostic_aggregator,
  diagnostic_common_diagnostics,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  self_test,
  substituteSource,
}:
let
  sources = rec {
    diagnostics = substituteSource {
      src = fetchgit {
        name = "diagnostics-source";
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
  src = sources.diagnostics;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_aggregator diagnostic_common_diagnostics diagnostic_updater self_test ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "diagnostics";
  };
}
