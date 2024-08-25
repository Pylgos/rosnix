{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    fuse_doc = substituteSource {
      src = fetchgit {
        name = "fuse_doc-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "511a9976d86f43dd34069a80a7c2af0639732feb";
        hash = "sha256-WO9MmQ05tSvFEj9bHtD3Sue1ivrTT97yZENUawog6Ms=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_doc";
  version = "1.2.0-1";
  src = sources.fuse_doc;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The fuse_doc package provides documentation and examples for the fuse package.";
  };
}
