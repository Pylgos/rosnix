{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_eigen-0f5856a86be05896af48e06baaddcd0f349fb700 = substituteSource {
      src = fetchgit {
        name = "ecl_eigen-0f5856a86be05896af48e06baaddcd0f349fb700-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "0f5856a86be05896af48e06baaddcd0f349fb700";
        hash = "sha256-tkEm2XgT3kJqdj/+L317KVB0SOyCjRKuLqsOWToPxbo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_eigen";
  version = "1.2.1-4";
  src = sources.ecl_eigen-0f5856a86be05896af48e06baaddcd0f349fb700;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This provides an Eigen implementation for ecl's linear algebra.";
  };
}
