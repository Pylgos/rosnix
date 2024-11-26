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
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libboost-python-dev" "python3" "python3-numpy" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "catch2" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "odri_master_board_sdk" = substituteSource {
        src = fetchgit {
          name = "odri_master_board_sdk-source";
          url = "https://github.com/ros2-gbp/odri_master_board_sdk-release.git";
          rev = "41c57d95b2495d683c3b3e74c7db7e79436dea4c";
          hash = "sha256-hVYlw+fnKfoLeEwC3IzJJzmd2oDeFVlqPOm0WJxqJlg=";
        };
      };
    });
  };
  meta = {
    description = "This project contains the sdk for the communication between a computer and the master-board";
  };
})
