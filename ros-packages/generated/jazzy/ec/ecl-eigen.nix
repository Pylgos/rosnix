{
  ament-cmake-ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ecl_eigen" = substituteSource {
      src = fetchgit {
        name = "ecl_eigen-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "208e5f42160f4e760287d44b5c5cd0ede3331972";
        hash = "sha256-tkEm2XgT3kJqdj/+L317KVB0SOyCjRKuLqsOWToPxbo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ecl_eigen";
  version = "1.2.1-5";
  src = sources."ecl_eigen";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
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
