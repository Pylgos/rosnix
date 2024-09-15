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
}:
let
  sources = rec {
    rti_connext_dds_cmake_module = substituteSource {
      src = fetchgit {
        name = "rti_connext_dds_cmake_module-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "2ef5476e929c1ce5f1f4b0f6ffab576fad18af4d";
        hash = "sha256-G4Jg0f5c/S87/zsn3lssXeLFNlBkBTwfsbqoV5Q2CfE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rti_connext_dds_cmake_module";
  version = "0.24.1-1";
  src = sources.rti_connext_dds_cmake_module;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "rti-connext-dds-6.0.1" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Helper module to provide access to RTI products like Connext DDS Professional";
  };
}
