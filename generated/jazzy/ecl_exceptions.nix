{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_errors,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_exceptions = substituteSource {
      src = fetchgit {
        name = "ecl_exceptions-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "be56e8dab26536c5577b5810ea4272f1a4542070";
        hash = "sha256-vSUx0IaohNthgxC/EHPPCyDY6YrVAcZUT4u5L099eA4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_exceptions";
  version = "1.2.1-5";
  src = sources.ecl_exceptions;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Template based exceptions - these are simple and practical and avoid the proliferation of exception types. Although not syntatactically ideal, it is convenient and eminently practical.";
  };
}
