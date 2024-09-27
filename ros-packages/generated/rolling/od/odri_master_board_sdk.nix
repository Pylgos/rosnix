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
    odri_master_board_sdk-41c57d95b2495d683c3b3e74c7db7e79436dea4c = substituteSource {
      src = fetchgit {
        name = "odri_master_board_sdk-41c57d95b2495d683c3b3e74c7db7e79436dea4c-source";
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
  src = sources.odri_master_board_sdk-41c57d95b2495d683c3b3e74c7db7e79436dea4c;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-python-dev" "python3" "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "catch2" ]; };
  meta = {
    description = "This project contains the sdk for the communication between a computer and the master-board";
  };
}
