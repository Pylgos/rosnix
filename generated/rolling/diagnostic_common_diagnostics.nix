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
        rev = "4b20f4229b1705462fbe5e03bb836b7a57cb4ba1";
        hash = "sha256-2NimeigLf9/541X65+HmoleeXvmBeu8RM5w+uDC1KeE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_common_diagnostics";
  version = "4.3.1-1";
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
