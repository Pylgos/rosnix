{
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
        rev = "37b1e22850ff40c0ba7953a019f79ef8aa011ea7";
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
  propagatedNativeBuildInputs = [ doxygen git ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3 python3Packages.boost python3Packages.numpy python3Packages.scipy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Bindings between Numpy and Eigen using Boost.Python";
  };
}
