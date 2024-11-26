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
  version = "0.9.2-4";
  src = finalAttrs.passthru.sources."ruckig";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ruckig" = substituteSource {
        src = fetchgit {
          name = "ruckig-source";
          url = "https://github.com/ros2-gbp/ruckig-release.git";
          rev = "32c387d879a88ffaf2a9ea5510a9f1eeabe47ab5";
          hash = "sha256-xzv0PejVB2frTXtd7fnF72E49MOQaARx6boGHYzyVnQ=";
        };
      };
    });
  };
  meta = {
    description = "Instantaneous Motion Generation for Robots and Machines.";
  };
})
