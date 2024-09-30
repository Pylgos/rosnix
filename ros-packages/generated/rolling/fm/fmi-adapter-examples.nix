{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmi-adapter,
  launch,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "fmi_adapter_examples" = substituteSource {
      src = fetchgit {
        name = "fmi_adapter_examples-source";
        url = "https://github.com/ros2-gbp/fmi_adapter-release.git";
        rev = "a6889685823269750f2f825fce47be547fc5308b";
        hash = "sha256-FNLnKvCy1QMsMlkdwfiwnupdtP9U06oTSPaQTkp7XOA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "fmi_adapter_examples";
  version = "2.1.2-2";
  src = sources."fmi_adapter_examples";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fmi-adapter launch launch-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides small examples for use of the fmi_adapter package";
  };
}
