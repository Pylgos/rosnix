{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_converters,
  ecl_exceptions,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_formatters = substituteSource {
      src = fetchgit {
        name = "ecl_formatters-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "66e2096786bed9bb97c5e5d2c8d2518a673a3790";
        hash = "sha256-KJ9Xhcl2ACKk7qJz2OTu+dVkgzMcvIBEwmXdl0NaiKg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_formatters";
  version = "1.2.1-4";
  src = sources.ecl_formatters;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_converters ecl_exceptions ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The formatters here simply format various input types to a specified text format. They can be used with most streaming types (including both ecl and stl streams).";
  };
}
