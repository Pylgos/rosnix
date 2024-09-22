{
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    sdformat_test_files = substituteSource {
      src = fetchFromGitHub {
        name = "sdformat_test_files-source";
        owner = "ros2-gbp";
        repo = "sdformat_urdf-release";
        rev = "8c299f750f424fdc4c3f0f040c8f9cf222b0299d";
        hash = "sha256-mSjrs/uxaDwGlXpCRMQumT42Y93HGoSMp9QYSk9aTD8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdformat_test_files";
  version = "1.0.2-1";
  src = sources.sdformat_test_files;
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
