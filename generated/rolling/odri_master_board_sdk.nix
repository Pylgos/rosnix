{
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
        rev = "41c57d95b2495d683c3b3e74c7db7e79436dea4c";
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
  propagatedNativeBuildInputs = [ git ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3 python3Packages.boost python3Packages.numpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "catch2" ];
  meta = {
    description = "This project contains the sdk for the communication between a computer and the master-board";
  };
}
