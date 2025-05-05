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
  pname = "ruckig";
  version = "0.9.2-5";
  src = finalAttrs.passthru.sources."ruckig";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ruckig" = substituteSource {
      src = fetchgit {
        name = "ruckig-source";
        url = "https://github.com/ros2-gbp/ruckig-release.git";
        rev = "6e6056ac1b4b292b397710b0c242512eaac92bd4";
        hash = "sha256-xzv0PejVB2frTXtd7fnF72E49MOQaARx6boGHYzyVnQ=";
      };
    };
  });
  meta = {
    description = "Instantaneous Motion Generation for Robots and Machines.";
  };
})
