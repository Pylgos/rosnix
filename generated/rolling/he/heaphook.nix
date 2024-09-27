{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  tlsf,
}:
let
  sources = rec {
    heaphook-0dfc6a7bc97643a1c10712d92295746dc868ca44 = substituteSource {
      src = fetchgit {
        name = "heaphook-0dfc6a7bc97643a1c10712d92295746dc868ca44-source";
        url = "https://github.com/ros2-gbp/heaphook-release.git";
        rev = "0dfc6a7bc97643a1c10712d92295746dc868ca44";
        hash = "sha256-muNY40LV1Jqtg043Lo1oCWIqz93a3zVaQ23jgFaEOPE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "heaphook";
  version = "0.1.1-2";
  src = sources.heaphook-0dfc6a7bc97643a1c10712d92295746dc868ca44;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ tlsf ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Replace all the dynamic heap allocation functions by LD_PRELOAD";
  };
}
