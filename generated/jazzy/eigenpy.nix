{
  buildPackages,
  buildRosPackage,
  cmake,
  doxygen,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  python3,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    eigenpy = substituteSource {
      src = fetchgit {
        name = "eigenpy-source";
        url = "https://github.com/ros2-gbp/eigenpy-release.git";
        rev = "a7fcfca7312d7d98686fce1b2b23b9b5af161e46";
        hash = "sha256-SjF0ivZjk1x6wk3jjCcgoenV6ZIsE6PF1YxvNwIFVVo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "eigenpy";
  version = "3.8.2-1";
  src = sources.eigenpy;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ doxygen git buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3 python3Packages.boost python3Packages.scipy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Bindings between Numpy and Eigen using Boost.Python";
  };
}
