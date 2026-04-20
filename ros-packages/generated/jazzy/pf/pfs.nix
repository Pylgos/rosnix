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
  pname = "pfs";
  version = "0.13.1-1";
  src = finalAttrs.passthru.sources."pfs";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pfs" = substituteSource {
      src = fetchgit {
        name = "pfs-source";
        url = "https://github.com/ros2-gbp/pfs-release.git";
        rev = "0cd0ada58dd3834d6e6bdae048ed1f663f1aeea6";
        hash = "sha256-cL2FpiLM3LTsUbvKXa15vRaM+Kd9yE1CXn+xBA9xoVE=";
      };
    };
  });
  meta = {
    description = "Production grade, very easy to use, procfs parsing library in C++";
  };
})
