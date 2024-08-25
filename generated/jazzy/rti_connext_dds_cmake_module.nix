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
        rev = "7fbef60e22d457caca1ed2d7306bc51a1368bf80";
        hash = "sha256-RykpmIJ4bETrDDRubjorqi5Ls7IWS+G547VkutoTzBg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rti_connext_dds_cmake_module";
  version = "0.22.0-2";
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
