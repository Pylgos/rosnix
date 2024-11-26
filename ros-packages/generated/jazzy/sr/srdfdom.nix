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
  version = "2.0.5-1";
  src = finalAttrs.passthru.sources."srdfdom";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ console-bridge-vendor tinyxml2-vendor urdf urdfdom-headers urdfdom-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libconsole-bridge-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "srdfdom" = substituteSource {
        src = fetchgit {
          name = "srdfdom-source";
          url = "https://github.com/ros2-gbp/srdfdom-release.git";
          rev = "1ecaddf54d764a6264c6a34a1f0d1acedaf6d259";
          hash = "sha256-prL0Yiv6HgqxBVa5raU7ocG1FLScJku5/Ka/7m0aKOM=";
        };
      };
    });
  };
  meta = {
    description = "Parser for Semantic Robot Description Format (SRDF).";
  };
})
