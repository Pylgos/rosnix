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
  version = "1.16.0-1";
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
        rev = "f2d8e60e8617ab2d878321bd9d2d75953c35f8dc";
        hash = "sha256-TzTN3VKdLoKPN/s7eFK5ZKM9EPADViLBaWTp+VK7Xj4=";
      };
    };
  });
  meta = {
    description = "The package provides GoogleMock.";
  };
})
