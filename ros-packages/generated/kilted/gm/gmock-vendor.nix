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
  version = "1.15.1-2";
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
        rev = "db29c69c20d339a90d8c026095030ba0c6111c4f";
        hash = "sha256-uKp3TTBlgpbASaDN797SqrvHjVAxsKzYPmK5jNnS/xU=";
      };
    };
  });
  meta = {
    description = "The package provides GoogleMock.";
  };
})
