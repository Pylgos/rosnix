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
  pname = "sick_safevisionary_base";
  version = "1.0.1-3";
  src = finalAttrs.passthru.sources."sick_safevisionary_base";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sick_safevisionary_base" = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_base-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_base-release.git";
        rev = "18585c024487f95ca328297b7bb8d11c748e3d2a";
        hash = "sha256-EMtEy8XLykxcLHYCPgk6Ralivtfddx0U4aPIsdnxSlc=";
      };
    };
  });
  meta = {
    description = "The package provides the basic hardware interface to the SICK Safevisionary sensor";
  };
})
