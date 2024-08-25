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
        rev = "00c43ed56545d657e65c2d9df7aae526f9624e13";
        hash = "sha256-AzJrNRj+c+u/OLswKvFbPe9agz7fRITYCGNA6rW8/SY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libg2o";
  version = "2020.5.29-6";
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
