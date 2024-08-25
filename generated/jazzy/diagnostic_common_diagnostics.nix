{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing_ament_cmake,
  lm_sensors,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    diagnostic_common_diagnostics = substituteSource {
      src = fetchgit {
        name = "diagnostic_common_diagnostics-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "63df07968b261e3b11fbe4a1ea95e448d5aa0af2";
        hash = "sha256-eWgig3BA0/7wXwWPPvjt708xl2DtP2Ll7XnpPE5M6Q0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_common_diagnostics";
  version = "4.2.1-1";
  src = sources.diagnostic_common_diagnostics;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_updater lm_sensors python3Packages.psutil ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_pytest ament_cmake_xmllint ament_lint_auto launch_testing_ament_cmake ];
  missingDependencies = [ "python3-ntplib" ];
  meta = {
    description = "diagnostic_common_diagnostics";
  };
}
