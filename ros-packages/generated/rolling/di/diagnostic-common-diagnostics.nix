{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "diagnostic_common_diagnostics" = substituteSource {
      src = fetchgit {
        name = "diagnostic_common_diagnostics-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "4b20f4229b1705462fbe5e03bb836b7a57cb4ba1";
        hash = "sha256-2NimeigLf9/541X65+HmoleeXvmBeu8RM5w+uDC1KeE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "diagnostic_common_diagnostics";
  version = "4.3.1-1";
  src = sources."diagnostic_common_diagnostics";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic-updater ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "lm-sensors" "python3-ntplib" "python3-psutil" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-pytest ament-cmake-xmllint ament-lint-auto launch-testing-ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "diagnostic_common_diagnostics";
  };
}
