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
  urdf,
  urdfdom-headers,
  urdfdom-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "srdfdom";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."srdfdom";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ console-bridge-vendor urdf urdfdom-headers urdfdom-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" "libconsole-bridge-dev" "tinyxml2" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ console-bridge-vendor urdf urdfdom-headers urdfdom-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libconsole-bridge-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "srdfdom" = substituteSource {
      src = fetchgit {
        name = "srdfdom-source";
        url = "https://github.com/ros2-gbp/srdfdom-release.git";
        rev = "1d9690926eaeeb2905b64585edbd4a40087708f4";
        hash = "sha256-eJsCCHKKlyFS57S3yBj5BukEtmA5CiN6kdkf8t/cyNo=";
      };
    };
  });
  meta = {
    description = "Parser for Semantic Robot Description Format (SRDF).";
  };
})
