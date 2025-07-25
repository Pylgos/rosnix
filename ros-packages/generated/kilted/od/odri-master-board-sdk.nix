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
  version = "1.0.7-3";
  src = finalAttrs.passthru.sources."odri_master_board_sdk";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "libboost-python-dev" "python3" "python3-numpy" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "git" "libboost-python-dev" "python3" "python3-numpy" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "catch2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "odri_master_board_sdk" = substituteSource {
      src = fetchgit {
        name = "odri_master_board_sdk-source";
        url = "https://github.com/ros2-gbp/odri_master_board_sdk-release.git";
        rev = "af4d15d7affbeaa03e5dfdc654665b7d16eccf2b";
        hash = "sha256-hVYlw+fnKfoLeEwC3IzJJzmd2oDeFVlqPOm0WJxqJlg=";
      };
    };
  });
  meta = {
    description = "\n        This project contains the sdk for the communication between a computer\n        and the master-board\n    ";
  };
})
