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
  version = "1.16.1-1";
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
        rev = "0e2453c8100491c2f1f1fdc851983e5e9e1d0ebe";
        hash = "sha256-9kL/vH06a46B6MUi6eWGbuLmsNf25VekwaBhyRyz9IM=";
      };
    };
  });
  meta = {
    description = "The package provides GoogleMock.";
  };
})
