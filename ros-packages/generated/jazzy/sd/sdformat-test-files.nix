{
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
    "sdformat_test_files" = substituteSource {
      src = fetchgit {
        name = "sdformat_test_files-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "8c299f750f424fdc4c3f0f040c8f9cf222b0299d";
        hash = "sha256-mSjrs/uxaDwGlXpCRMQumT42Y93HGoSMp9QYSk9aTD8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "sdformat_test_files";
  version = "1.0.2-1";
  src = sources."sdformat_test_files";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Example SDFormat XML files for testing tools using hthis format.";
  };
}
