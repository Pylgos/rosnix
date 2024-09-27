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
    eigen_stl_containers-764dd93e29b143630f05b7e6396789c2967395f3 = substituteSource {
      src = fetchgit {
        name = "eigen_stl_containers-764dd93e29b143630f05b7e6396789c2967395f3-source";
        url = "https://github.com/ros2-gbp/eigen_stl_containers-release.git";
        rev = "764dd93e29b143630f05b7e6396789c2967395f3";
        hash = "sha256-Zjjaom5lCGLMKC33kq6er1Ji54XUj/3hkSIWcBnXI+E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "eigen_stl_containers";
  version = "1.0.0-7";
  src = sources.eigen_stl_containers-764dd93e29b143630f05b7e6396789c2967395f3;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package provides a set of typedef's that allow using Eigen datatypes in STL containers";
  };
}
