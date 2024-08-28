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
        rev = "59964cc674d0c3424f6db5978a4dc0cdaba49839";
        hash = "sha256-MZ1G6CeMAyd4QNxOthd+LfXnpGHVqb9yi1wUbSJFhTU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "eigenpy";
  version = "3.7.0-1";
  src = sources.eigenpy;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ doxygen eigen git buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3 python3Packages.boost python3Packages.scipy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Bindings between Numpy and Eigen using Boost.Python";
  };
}
