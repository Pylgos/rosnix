{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmi_adapter,
  launch,
  launch_ros,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    fmi_adapter_examples = substituteSource {
      src = fetchgit {
        name = "fmi_adapter_examples-source";
        url = "https://github.com/ros2-gbp/fmi_adapter-release.git";
        rev = "d784763bdaa87a53b3bed241dc18f46bc3fc6d1e";
        hash = "sha256-FNLnKvCy1QMsMlkdwfiwnupdtP9U06oTSPaQTkp7XOA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fmi_adapter_examples";
  version = "2.1.2-1";
  src = sources.fmi_adapter_examples;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fmi_adapter launch launch_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides small examples for use of the fmi_adapter package";
  };
}
