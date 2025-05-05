{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-cmake,
  buildAmentCmakePackage,
  console-bridge-vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tinyxml2-vendor,
  urdf,
  urdfdom-headers,
  urdfdom-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "srdfdom";
  version = "2.0.7-1";
  src = finalAttrs.passthru.sources."srdfdom";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ console-bridge-vendor tinyxml2-vendor urdf urdfdom-headers urdfdom-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" "libconsole-bridge-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ console-bridge-vendor tinyxml2-vendor urdf urdfdom-headers urdfdom-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libconsole-bridge-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "srdfdom" = substituteSource {
      src = fetchgit {
        name = "srdfdom-source";
        url = "https://github.com/ros2-gbp/srdfdom-release.git";
        rev = "8ef7596a27fee3518869d9bc47c9d5612b69f407";
        hash = "sha256-Y43XZ4Ah7okzBvMXyDksanhoU85h7//Ua4vEPQLhQ0Y=";
      };
    };
  });
  meta = {
    description = "Parser for Semantic Robot Description Format (SRDF).";
  };
})
