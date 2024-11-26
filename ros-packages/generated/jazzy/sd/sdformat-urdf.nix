{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rcutils,
  rosSystemPackages,
  sdformat-test-files,
  sdformat-vendor,
  substituteSource,
  tinyxml2-vendor,
  urdf,
  urdf-parser-plugin,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sdformat_urdf";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."sdformat_urdf";
  propagatedNativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ pluginlib rcutils sdformat-vendor tinyxml2-vendor urdf urdf-parser-plugin ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-headers-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common sdformat-test-files ];
  passthru.sources = mkSourceSet (sources: {
    "sdformat_urdf" = substituteSource {
      src = fetchgit {
        name = "sdformat_urdf-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "d923456c7a3c40a1cf8b8c32e52f9838c95ddfde";
        hash = "sha256-QJfr03O+ead4T8Bj6BazQbRKJsmW3J6I9g1XWtun6Us=";
      };
    };
  });
  meta = {
    description = "URDF plugin to parse SDFormat XML into URDF C++ DOM objects.";
  };
})
