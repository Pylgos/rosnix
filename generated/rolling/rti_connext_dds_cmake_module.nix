{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
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
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Helper module to provide access to RTI products like Connext DDS Professional";
  };
}
