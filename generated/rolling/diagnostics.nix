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
        rev = "ce42e22097ad15f7516fde4b083340ca50eb47ff";
        hash = "sha256-l3QPJ4Xu3yMkA7yhNrczocqHrcyZKJZIGh2zU5k7oRk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostics";
  version = "4.3.1-1";
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
