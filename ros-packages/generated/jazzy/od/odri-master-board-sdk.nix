{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "odri_master_board_sdk";
  version = "1.0.7-1";
  src = finalAttrs.passthru.sources."odri_master_board_sdk";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "python3-numpy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libboost-python-dev" "python3" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "catch2" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "odri_master_board_sdk" = substituteSource {
        src = fetchgit {
          name = "odri_master_board_sdk-source";
          url = "https://github.com/ros2-gbp/odri_master_board_sdk-release.git";
          rev = "f9d88ebd513a52017ea5ed9940f9fbb6ab659608";
          hash = "sha256-hVYlw+fnKfoLeEwC3IzJJzmd2oDeFVlqPOm0WJxqJlg=";
        };
      };
    });
  };
  meta = {
    description = "This project contains the sdk for the communication between a computer and the master-board";
  };
})
