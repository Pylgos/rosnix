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
    fuse_doc-24121e81f24f166c52c66267ea0be8332a1446a5 = substituteSource {
      src = fetchgit {
        name = "fuse_doc-24121e81f24f166c52c66267ea0be8332a1446a5-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "24121e81f24f166c52c66267ea0be8332a1446a5";
        hash = "sha256-uY1vnIJQ0LsiGyvvSWFiqNVyu1/Ag328pzFCn2jhhsQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_doc";
  version = "1.1.1-1";
  src = sources.fuse_doc-24121e81f24f166c52c66267ea0be8332a1446a5;
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
