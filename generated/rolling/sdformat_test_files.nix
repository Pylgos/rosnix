{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    sdformat_test_files = substituteSource {
      src = fetchgit {
        name = "sdformat_test_files-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "065a5a0dd7475b2a2b143a4e7c62af270f672ceb";
        hash = "sha256-+OOpBAUO+g0O8UYgUSQRn8TIzn3Zyi//hG89iyzKo8U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdformat_test_files";
  version = "2.0.1-1";
  src = sources.sdformat_test_files;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Example SDFormat XML files for testing tools using hthis format.";
  };
}
