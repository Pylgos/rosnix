{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_license,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_errors = substituteSource {
      src = fetchFromGitHub {
        name = "ecl_errors-source";
        owner = "ros2-gbp";
        repo = "ecl_lite-release";
        rev = "22b35c290286e16af8fc32b17a30d92f0dbc0f16";
        hash = "sha256-tMZvRB3bre8Dk+0YS+OqnkCGKff09J6PKWHytWxelmk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_errors";
  version = "1.2.0-5";
  src = sources.ecl_errors;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_config ecl_license ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This library provides lean and mean error mechanisms. It includes c style error functions as well as a few useful macros. For higher level mechanisms, refer to ecl_exceptions.";
  };
}
