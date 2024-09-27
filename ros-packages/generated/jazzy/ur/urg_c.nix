{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "urg_c" = substituteSource {
      src = fetchgit {
        name = "urg_c-source";
        url = "https://github.com/ros2-gbp/urg_c-release.git";
        rev = "83e66702d52c8fc284861f6a7064354003c773a3";
        hash = "sha256-d1sMppxyaGt43L2i5Eplkfen4tHz1t6hkC42mCbg0EM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "urg_c";
  version = "1.0.4001-6";
  src = sources."urg_c";
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
