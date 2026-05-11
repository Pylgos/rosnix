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
  version = "1.17.0-2";
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
        rev = "863c8837123ed95640c049dc228abd3d1dcf2628";
        hash = "sha256-RVGxqN2y6xLFqlB2LF8ioVfKIPNf8qvZzqldeaZ2ah8=";
      };
    };
  });
  meta = {
    description = "The package provides GoogleMock.";
  };
})
