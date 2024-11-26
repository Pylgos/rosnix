{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "gmock_vendor";
  version = "1.15.0-1";
  src = finalAttrs.passthru.sources."gmock_vendor";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gtest-vendor ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gtest-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "gmock_vendor" = substituteSource {
      src = fetchgit {
        name = "gmock_vendor-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "c60fba5e11ad4a220c21762d27d29fb55ae7658d";
        hash = "sha256-PO/ALDgFYiKLU8D1fDgoIVSAMJ3CCBpN60MYHS42E10=";
      };
    };
  });
  meta = {
    description = "The package provides GoogleMock.";
  };
})
