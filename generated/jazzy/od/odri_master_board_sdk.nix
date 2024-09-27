{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    odri_master_board_sdk-f9d88ebd513a52017ea5ed9940f9fbb6ab659608 = substituteSource {
      src = fetchgit {
        name = "odri_master_board_sdk-f9d88ebd513a52017ea5ed9940f9fbb6ab659608-source";
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
  src = sources.odri_master_board_sdk-f9d88ebd513a52017ea5ed9940f9fbb6ab659608;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-python-dev" "python3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "catch2" ]; };
  meta = {
    description = "This project contains the sdk for the communication between a computer and the master-board";
  };
}
