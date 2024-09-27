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
    urg_c-4c60b98378f46c788415cc07dcea0462834ba9bd = substituteSource {
      src = fetchgit {
        name = "urg_c-4c60b98378f46c788415cc07dcea0462834ba9bd-source";
        url = "https://github.com/ros2-gbp/urg_c-release.git";
        rev = "4c60b98378f46c788415cc07dcea0462834ba9bd";
        hash = "sha256-d1sMppxyaGt43L2i5Eplkfen4tHz1t6hkC42mCbg0EM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urg_c";
  version = "1.0.4001-5";
  src = sources.urg_c-4c60b98378f46c788415cc07dcea0462834ba9bd;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The urg_c package";
  };
}
