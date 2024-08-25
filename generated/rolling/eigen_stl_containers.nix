{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    eigen_stl_containers = substituteSource {
      src = fetchgit {
        name = "eigen_stl_containers-source";
        url = "https://github.com/ros2-gbp/eigen_stl_containers-release.git";
        rev = "e9ab518e7f504037094a576f85e52d674b031009";
        hash = "sha256-Zjjaom5lCGLMKC33kq6er1Ji54XUj/3hkSIWcBnXI+E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "eigen_stl_containers";
  version = "1.0.0-6";
  src = sources.eigen_stl_containers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "This package provides a set of typedef's that allow using Eigen datatypes in STL containers";
  };
}
