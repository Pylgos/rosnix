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
    rti_connext_dds_cmake_module-7fbef60e22d457caca1ed2d7306bc51a1368bf80 = substituteSource {
      src = fetchgit {
        name = "rti_connext_dds_cmake_module-7fbef60e22d457caca1ed2d7306bc51a1368bf80-source";
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
  src = sources.rti_connext_dds_cmake_module-7fbef60e22d457caca1ed2d7306bc51a1368bf80;
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
