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
    ecl_time_lite = substituteSource {
      src = fetchgit {
        name = "ecl_time_lite-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "e01d6ea66feaa66afcb6351f65934b129fd692fb";
        hash = "sha256-xUWy6QEatAillIK/EUqV549irG+mWxeknSHHCLIkMT0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_time_lite";
  version = "1.2.0-5";
  src = sources.ecl_time_lite;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Provides a portable set of time functions that are especially useful for porting other code or being wrapped by higher level c++ classes.";
  };
}
