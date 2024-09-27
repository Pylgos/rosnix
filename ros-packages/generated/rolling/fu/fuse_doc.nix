{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    fuse_doc-c658e987d2a36cf49176b6ffe7ba24ef3995dcfd = substituteSource {
      src = fetchgit {
        name = "fuse_doc-c658e987d2a36cf49176b6ffe7ba24ef3995dcfd-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "c658e987d2a36cf49176b6ffe7ba24ef3995dcfd";
        hash = "sha256-F+lncQ7oVAw0daL4HDz2el6pivmtqdBJ6xRM8J9Tqlo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_doc";
  version = "1.2.1-1";
  src = sources.fuse_doc-c658e987d2a36cf49176b6ffe7ba24ef3995dcfd;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The fuse_doc package provides documentation and examples for the fuse package.";
  };
}
