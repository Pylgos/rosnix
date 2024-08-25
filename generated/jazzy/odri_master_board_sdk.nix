{
  buildPackages,
  buildRosPackage,
  cmake,
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
    odri_master_board_sdk = substituteSource {
      src = fetchgit {
        name = "odri_master_board_sdk-source";
        url = "https://github.com/ros2-gbp/odri_master_board_sdk-release.git";
        rev = "f9d88ebd513a52017ea5ed9940f9fbb6ab659608";
        hash = "sha256-hVYlw+fnKfoLeEwC3IzJJzmd2oDeFVlqPOm0WJxqJlg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "odri_master_board_sdk";
  version = "1.0.7-1";
  src = sources.odri_master_board_sdk;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ git buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3 python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "catch2" ];
  meta = {
    description = "This project contains the sdk for the communication between a computer and the master-board";
  };
}
