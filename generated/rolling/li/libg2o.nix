{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    libg2o-c30a14c800c9142b73205fd6c67827fab5295326 = substituteSource {
      src = fetchgit {
        name = "libg2o-c30a14c800c9142b73205fd6c67827fab5295326-source";
        url = "https://github.com/ros2-gbp/libg2o-release.git";
        rev = "c30a14c800c9142b73205fd6c67827fab5295326";
        hash = "sha256-2CMfNQ2nQezvsaS7kSEUvwkCtBZcnoOPaqOljhsfHFc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libg2o";
  version = "2020.5.29-5";
  src = sources.libg2o-c30a14c800c9142b73205fd6c67827fab5295326;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "opengl" "suitesparse" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The libg2o library from http://openslam.org/g2o.html";
  };
}
