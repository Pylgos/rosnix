{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmi_adapter,
  launch,
  launch_ros,
  substituteSource,
}:
let
  sources = rec {
    fmi_adapter_examples = substituteSource {
      src = fetchgit {
        name = "fmi_adapter_examples-source";
        url = "https://github.com/ros2-gbp/fmi_adapter-release.git";
        rev = "a6889685823269750f2f825fce47be547fc5308b";
        hash = "sha256-FNLnKvCy1QMsMlkdwfiwnupdtP9U06oTSPaQTkp7XOA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fmi_adapter_examples";
  version = "2.1.2-2";
  src = sources.fmi_adapter_examples;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmi_adapter launch launch_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Provides small examples for use of the fmi_adapter package";
  };
}
