{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  libGL,
  libGLU,
  substituteSource,
  suitesparse,
}:
let
  sources = rec {
    libg2o = substituteSource {
      src = fetchgit {
        name = "libg2o-source";
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
  src = sources.libg2o;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libGL libGLU suitesparse ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The libg2o library from http://openslam.org/g2o.html";
  };
}
